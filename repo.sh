function entrypoint_repo_routes {
  case "$2" in
    init)
      ${0%/*}/init-repo.sh "$@"
    ;;
    
    status)
      ${0%/*}/update-status.sh "$@"
    ;; 

    *)
       entrypoint_repo_help
       ;;
  esac
}
