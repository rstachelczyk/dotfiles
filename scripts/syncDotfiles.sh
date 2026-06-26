#!/bin/bash

# Sync dotfiles repo and ensure that dotfiles are tangled correctly afterward

GREEN='\033[1;32m'
BLUE='\033[1;34m'
RED='\033[1;31m'
NC='\033[0m'

# Navigate to the directory of this script (generally ~/.dotfiles/.bin)
cd $(dirname $(readlink -f $0))
cd ..

echo -e "${BLUE}Stashing existing changes...${NC}"
stash_result=$(git stash push -m "sync-dotfiles: Before syncing dotfiles")
needs_pop=1
if [ "$stash_result" = "No local changes to save" ]; then
    needs_pop=0
fi

# Snapshot submodules with local changes BEFORE pulling. After a pull that
# advances a submodule pointer, the working tree legitimately differs from the
# newly-recorded commit until `submodule update` runs -- so the '+' flag is only
# a reliable signal of *local* changes here, before the pointer moves.
#
# '+' = checked-out HEAD differs from the recorded commit (e.g. local commits)
divergent_submodules=$(git submodule status --recursive | grep '^+' | awk '{print $2}')
# Uncommitted changes in a submodule's working tree
dirty_submodules=$(git submodule foreach --quiet --recursive \
    'if [ -n "$(git status --porcelain)" ]; then echo "$sm_path"; fi')
problem_submodules=$(printf '%s\n%s\n' "$divergent_submodules" "$dirty_submodules" | sort -u | sed '/^$/d')

echo -e "${BLUE}Pulling updates from dotfiles repo...${NC}"
echo
git pull origin master
echo

if [ -n "$problem_submodules" ]; then
    echo -e "${RED}Skipping submodule update -- these submodules have local changes:${NC}"
    echo
    printf '  %s\n' $problem_submodules
    echo
    echo -e "${RED}Commit/push or discard them, then re-run this script.${NC}"
    echo
else
    echo -e "${BLUE}Updating submodules...${NC}"
    echo
    if ! git submodule update --init --recursive; then
        echo
        echo -e "${RED}Submodule update failed -- see the error above.${NC}"
    fi
    echo
fi

if [[ $needs_pop -eq 1 ]]; then
    echo -e "${BLUE}Popping stashed changes...${NC}"
    echo
    git stash pop
fi

unmerged_files=$(git diff --name-only --diff-filter=U)
if [[ ! -z $unmerged_files ]]; then
   echo -e "${RED}The following files have merge conflicts after popping the stash:${NC}"
   echo
   printf %"s\n" $unmerged_files  # Ensure newlines are printed
else
   # Run stow to ensure all new dotfiles are linked
   "$(dirname "$0")/stow.sh" all

   # Reload configs for already-running tools so changes take effect now
   if command -v tmux >/dev/null 2>&1 && tmux info >/dev/null 2>&1; then
      echo
      echo -e "${BLUE}Reloading tmux config...${NC}"
      tmux source-file "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"
   fi
fi

# These configs can't be reloaded from this script -- remind the user to do it
echo
echo -e "${GREEN}Note: these changes are not auto-reloaded -- apply them manually:${NC}"
echo -e "  ${GREEN}zsh${NC}     -> run 'exec zsh' or open a new shell"
echo -e "  ${GREEN}nvim${NC}    -> restart nvim (':Lazy restore' to match plugin versions)"
echo -e "  ${GREEN}ghostty${NC} -> press Cmd+Shift+, (reload_config) or restart Ghostty"
