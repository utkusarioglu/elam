do_adjustments() {
  phrase=$1
  replacement=$2
  current=$(cat .devcontainer/devcontainer.json | jq -r ".$phrase")
  if [ $? != 0 ]; then
    echo "Warn: Skipping '$phrase' as something went wrong."
    continue
  fi
  echo "Replacing '$current' with '$replacement'…"
  find . -type f \( \
    ! -iwholename "./${0%/*}/setup.sh" \
    ! -iname ".git" \
    \) \
    -exec sed -i "s:$current:$replacement:g" {} \;
}
