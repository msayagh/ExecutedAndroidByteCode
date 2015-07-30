#!/bin/sh

#  script.sh
#  
#
#  Created by Mohammed Sayagh on 2015-07-29.
#


programName=com.example.test
androidSDK=/Users/msayagh/android-sdks/build-tools/21.1.2/
breakPointProgram=createBreakPointsCommands.jar
getByteCodeProgram=getExecutedByteCode.jar
pathAndBug=AndBug/
vTraceFile=data/traces.txt
breakPointFile=data/BreakPointsHook.txt
dexFile=dexInput/classes.dex


export PATH=$androidSDK:$PATH

dexdump -d $dexFile | less > byteCode.txt

java -jar $breakPointProgram byteCode.txt support.v4  support.v7 > commandsToInsertBreakPoints.txt

scriptPath=`pwd`

cd $pathAndBug


export PYTHONPATH=`pwd`/lib

idProcess=$(adb shell ps | grep $programName | cut -d ' ' -f 5)

./andbug shell -p $idProcess

pwd
cd $scriptPath

java -jar $getByteCodeProgram $vTraceFile $breakPointFile byteCode.txt
