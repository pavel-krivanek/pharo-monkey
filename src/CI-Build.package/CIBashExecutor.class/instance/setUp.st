executing
setUp
	
	self currentBashFile
		addShebang;
		addComment: 'Add bash boilerplate';
		addStatement: 'set -o nounset';
		addStatement: 'unset CDPATH';
		newLine;
		declareVariable: '__dir' as: '"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"';
		declareVariable: '__file' as: '"${__dir}/$(basename "${BASH_SOURCE[0]}")"';
		declareVariable: '__base' as: '"$(basename ${__file} .sh)"';
		declareVariable: '__root' as: '"$(cd "$(dirname "${__dir}")" && pwd)"';
		declareVariable: '__build' as: '"${__dir}/build"';
		declareVariable: '__output' as: '"${__dir}/output"';
		declareVariable: '__task_name' as: self currentTask name;
		newLine;
		addStatement: 'rm -rf "${__build}"';
		addStatement: 'mkdir -p "${__build}"';
		addStatement: 'mkdir -p "${__output}"';
		addStatement: 'cd "${__build}"';
		newLine;
		addStatement: 'VERBOSE_OUTPUT_STREAM="${VERBOSE_OUTPUT_STREAM:-/dev/null}"';
		addStatement: 'LOGFILE="${__build}/${LOGFILE_NAME:-build.log}"';
		addStatement: 'run_command(){
  local command="$@"
  local exit_status=0
  touch "${LOGFILE}"
  echo "$ ${command}" | tee -a "${LOGFILE}" > /dev/stdout
  ${command} 2>&1 | tee -a "${LOGFILE}" > "${VERBOSE_OUTPUT_STREAM}" ; exit_status=${PIPESTATUS[0]}

  if [ ${exit_status} -ne 0 ]; then
		cat PharoDebug.log >> "${LOGFILE}"
		rm PharoDebug.log || true
      echo "ERROR" > "${__dir}/status"
      echo "[BUILD] Error in script. Check "${LOGFILE}" for more information"
      exit 1
  fi
}'.