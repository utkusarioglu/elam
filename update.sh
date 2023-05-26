function entrypoint_update_routes {
  case $2 in
    start)
      ${0%/*}/start-template-update.sh "$@"
    ;;

    reset)
      ${0%/*}/reset-template-update.sh "$@" 
    ;;

    finalize)
      ${0%/*}/finalize-template-update.sh "$@"
    ;;

    *)
      entrypoint_update_help
    ;;
  esac
}
