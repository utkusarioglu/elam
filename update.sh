function update_subcommand {
  case $2 in
    start)
      ${0%/*}/start-template-update.sh
    ;;

    reset)
      ${0%/*}/reset-template-update.sh
    ;;

    finalize)
      ${0%/*}/finalize-template-update.sh
    ;;

    *)
      echo 'elam update help'
      echo 'this is where elam update help lives'
  esac
}
