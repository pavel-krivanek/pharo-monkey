writing
writeRunCommandFunction

	self writeLine: ('
export VERBOSE_OUTPUT_STREAM="${VERBOSE_OUTPUT_STREAM:-/dev/null}"
export LOGFILE="${SCRIPT_DIRECTORY}/${LOGFILE_NAME:-build.log}"

run_command(){
  local SCRIPT="$@"
  local exit_status=0
  touch "${LOGFILE}"
  echo "$ ${SCRIPT}" | tee -a "${LOGFILE}" > "${VERBOSE_OUTPUT_STREAM}"
  ${SCRIPT} 2>&1 | tee -a "${LOGFILE}" > "${VERBOSE_OUTPUT_STREAM}" ; exit_status=${PIPESTATUS[0]}

  if [ ${exit_status} -ne 0 ]; then
      echo "ERROR" > "status"
      echo "[BUILD] Error in script. Check "${LOGFILE}" for more information"
      exit 1
  fi
}' copyReplaceAll: String cr with: String lf)