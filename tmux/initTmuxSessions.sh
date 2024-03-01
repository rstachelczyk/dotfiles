#!/bin/bash

# dockerRepo="~/repos/crypto"
# primaryRepo="$dockerRepo/code/crypto-api"
# secondaryRepo="$dockerRepo/code/crypto-ui"
# primaryRepo="$dockerRepo/code/vault-rails"
# secondaryRepo="$dockerRepo/code/transaction-rails"
# referencesRepo="~/references"
repoDir="~/repos"
dockerRepo="$repoDir/nps"
primaryRepo="$dockerRepo/code/payments-api"
secondaryRepo="$dockerRepo/code/westpac-processor-service"

main() {
  # initWorkSession
  # initWorkCmdSessionOld
  # initPersonalSession
  # initPersonalCmdSessionOld
  # initReferencesSession
  initWorkCmdSession "work-1"
  initWorkCmdSession "work-2"
  initPersonalCmdSession "personal-1"
  initPersonalCmdSession "personal-2"
}

initPersonalCmdSession() {
  local session="$1"
  tmux new-session -d -s $session

  local window=0
  tmux send-keys -t $session:$window "cd $repoDir; l" Enter

  local window=1
  tmux new-window -t $session:$window
  tmux send-keys -t $session:$window "cd $repoDir; l" Enter

  local window=2
  tmux new-window -t $session:$window
  tmux send-keys -t $session:$window "cd $repoDir; l" Enter

  local window=3
  tmux new-window -t $session:$window
  tmux send-keys -t $session:$window "cd $repoDir; l" Enter
}

initWorkCmdSession() {
  local session="$1"
  tmux new-session -d -s $session

  local window=0
  tmux send-keys -t $session:$window "cd $dockerRepo; l" Enter

  local window=1
  tmux new-window -t $session:$window
  tmux send-keys -t $session:$window "cd $dockerRepo; l" Enter

  local window=2
  tmux new-window -t $session:$window
  tmux send-keys -t $session:$window "cd $primaryRepo; l" Enter

  local window=3
  tmux new-window -t $session:$window
  tmux send-keys -t $session:$window "cd $secondaryRepo; l" Enter

  local window=4
  tmux new-window -t $session:$window
  tmux send-keys -t $session:$window "cd $dockerRepo; l" Enter
}

initWorkSession() {
  local session="work"
  tmux new-session -d -s $session

  local window=0
  tmux send-keys -t $session:$window "cd $dockerRepo; l; vim ." Enter

  local window=1
  tmux new-window -t $session:$window
  tmux send-keys -t $session:$window "cd $primaryRepo; l; vim ." Enter

  local window=2
  tmux new-window -t $session:$window
  tmux send-keys -t $session:$window "cd $secondaryRepo; l; vim ." Enter
}

initWorkCmdSessionOld() {
  local session="work-cmd"
  tmux new-session -d -s $session

  local window=0
  tmux send-keys -t $session:$window "cd $dockerRepo; l" Enter

  local window=1
  tmux new-window -t $session:$window
  tmux send-keys -t $session:$window "cd $primaryRepo; l" Enter

  local window=2
  tmux new-window -t $session:$window
  tmux send-keys -t $session:$window "cd $primaryRepo; l" Enter

  local window=3
  tmux new-window -t $session:$window
  tmux send-keys -t $session:$window "cd $secondaryRepo; l" Enter
}

initReferencesSession() {
  local session="references"
  tmux new-session -d -s $session

  local window=0
  tmux send-keys -t $session:$window "cd $referencesRepo; l; eobj" Enter
}

initPersonalSession() {
  local session="personal"
  tmux new-session -d -s $session

  # local window=0
  # tmux send-keys -t $session:$window "ssh lhome" Enter

  local window=1
  tmux new-window -t $session:$window

  local window=2
  tmux new-window -t $session:$window
}

initPersonalCmdSessionOld() {
  local session="personal-cmd"
  tmux new-session -d -s $session

  # local window=0
  # tmux send-keys -t $session:$window "ssh lhome" Enter

  local window=1
  tmux new-window -t $session:$window

  local window=2
  tmux new-window -t $session:$window

  local window=3
  tmux new-window -t $session:$window
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi

