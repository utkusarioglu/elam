#!/bin/bash

# Elam entrypoint
#
# For now, this file only calls the script files. 
# In time it should assume the role of the sole executable in the repo, 
# with all other script files only offering functionality

source ${0%/*}/docs.sh
source ${0%/*}/repo.sh
source ${0%/*}/update.sh

function entrypoint_routes {
  case "$1" in
    repo)
      entrypoint_repo_routes "$@"
    ;;

    update)
      entrypoint_update_routes "$@"
    ;;
    
    *)
      entrypoint_help
    ;;
  esac
}

entrypoint_routes "$@"
