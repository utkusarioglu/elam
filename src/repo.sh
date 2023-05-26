function entrypoint_repo_routes {
  case "$2" in
    init)
      source $SRC/init-repo.sh 
      repo_init "$@"
    ;;
    
    status)
      source $SRC/update-status.sh 
      repo_status "$@"
    ;; 

    *)
      entrypoint_repo_help
     ;;
  esac
}
