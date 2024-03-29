#!/bin/bash

source $SRC/constants.sh
source .env 2> /dev/null
source $REPO/$REPO_CONFIG_FILE

check_repo_config() {
  if [ ! -f "$REPO/$REPO_CONFIG_FILE" ];
  then
    echo "Error \`$REPO_CONFIG_FILE\` file is required to configure the scripts' behavior"
    exit 20
  fi

  source $REPO/$REPO_CONFIG_FILE
}

check_repo_template_config() {
  for var in TEMPLATE_REPO_ORIGIN TEMPLATE_REPO_URL TEMPLATE_LAST_COMMIT_EPOCH;
  do
    if [ -z "$var" ];
    then
      echo "Error: \`$file_name.$var\` needs to be set for this script to work"
      exit 21
    fi
  done
}

check_parent_template_config() {
  file_name=$REPO/$PARENT_TEMPLATE_CONFIG_FILE
  if [ ! -f "$file_name" ];
  then
    echo "Error \`$PARENT_TEMPLATE_CONFIG_FILE\` file is required to configure the scripts' behavior"
    exit 20
  fi

  source $file_name

  for var in TEMPLATE_REPO_ORIGIN TEMPLATE_REPO_URL TEMPLATE_LAST_COMMIT_EPOCH;
  do
    if [ -z "$var" ];
    then
      echo "Error: \`$file_name.$var\` needs to be set for this script to work"
      exit 21
    fi
  done
}

check_repo_update_type() {
  local_repo_url=$(git remote get-url origin)
  REPO_UPDATE_TYPE="none"

  has_parent_config() ( [ -f $REPO/$PARENT_TEMPLATE_CONFIG_FILE ] )
  has_repo_config() ( [ -f $REPO/$REPO_CONFIG_FILE ] )
  origin_matches_template_url()[[ "$local_repo_url" == "$TEMPLATE_REPO_URL" ]]
  
  if (! origin_matches_template_url) && has_repo_config; then
    REPO_UPDATE_TYPE="repository"
  fi

  if origin_matches_template_url && has_parent_config; then
    REPO_UPDATE_TYPE="template"
  fi
}
