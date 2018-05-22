#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
export CCHK="java -classpath ./lib/antlr-4.7.1-complete.jar:./bin Main"
cat > ./code/program.txt   # save everything in stdin to program.txt
$CCHK
bash c2nasm.bash ./code/aha.cc -O0