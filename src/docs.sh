source $SRC/constants.sh

function entrypoint_help {
  echo -e "${BOLD_BLUE_TEXT}Elam Repo Updater${DEFAULT_TEXT}"
  echo
  cat << EOF
Elam allows you to update your repos using other repos as templates.
EOF
  echo
  echo -e "${GREEN_TEXT}Usage${DEFAULT_TEXT}"
  echo
  cat << EOF
All you need to do is choose some other git repo as a template. 
Elam with let you know if there are new pushes to your template repo.
Then you can pick and choose the changes you'd like to migrate to your
own project.
EOF
}

function entrypoint_repo_help {
  cat << EOF
elam repo <subcommand>

Subcommands:

init:    Initializes elam inside the given repo.
status:  Checks whether there are any significant events in your template.
EOF
}

function entrypoint_update_help {
  cat << EOF
elam update <subcommand>

Subcommands:

start:     Start the update process. 
reset:     Reset the ongoing update process and return the repo to its 
           pre-start state.
finalize:  Finalize the update process once you are satisfied with the
           changes.
EOF
}
