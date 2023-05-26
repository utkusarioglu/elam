function repo_subcommand {
  case "$2" in
    init)
      ${0%/*}/init-repo.sh "$@"
    ;;
    
    status)
      ${0%/*}/update-status.sh "$@"
    ;; 

    *)
       echo 'elam repo'
       echo 'elam repo help is here'
       ;;
  esac
}
