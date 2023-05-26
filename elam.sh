#!/bin/bash

# Elam entrypoint
#
# For now, this file only calls the script files. 
# In time it should assume the role of the sole executable in the repo, 
# with all other script files only offering functionality

source ${0%/*}/repo.sh
source ${0%/*}/update.sh

case "$1" in
  repo)
    repo_subcommand "$@"
  ;;

  update)
    update_subcommand "$@"
  ;;
  
  *)
    echo 'help'
    ;;

  # update-status)
  #   echo 'Update status'
  #   ${0%/*}/update-status.sh
  #   ;;

  # init-repo)
  #   echo 'Init repo'
  #   ${0%/*}/init-repo.sh
  #   ;;
  
  # start-template-update)
  #   echo 'Start template update'
  #   ${0%/*}/start-template-update.sh
  #   ;;
  
  # reset-template-update)
  #   echo 'Reset template update'
  #   ${0%/*}/reset-template-update.sh
  #   ;;
  
  # finalize-template-update)
  #   echo 'Finalize template update'
  #   ${0%/*}/finalize-template-update.sh
  #   ;;
esac
