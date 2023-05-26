function entrypoint_update_routes {
  case $2 in
    start)
      source $SRC/start-template-update.sh
      update_start "$@"
    ;;

    reset)
      source $SRC/reset-template-update.sh
      update_reset "$@" 
    ;;

    finalize)
      source $SRC/finalize-template-update.sh 
      update_finalize "$@"
    ;;

    *)
      entrypoint_update_help
    ;;
  esac
}
