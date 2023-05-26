#!/bin/bash

SRC=$(dirname ${BASH_SOURCE[0]})
echo $SRC
# Elam entrypoint
#
# For now, this file only calls the script files. 
# In time it should assume the role of the sole executable in the repo, 
# with all other script files only offering functionality
source $SRC/constants.sh
source $SRC/docs.sh
source $SRC/repo.sh
source $SRC/update.sh

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
