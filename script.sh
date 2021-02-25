#!/bin/bash

#COSTANTS
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;36m'
NC='\033[0m'

helpFunction()
{
   printf "\n${NC}Usage: $0 -m\"My nice feature\""
   printf "\n${NC}\t -m'My nice feature'"
   exit 1 # Exit script after printing help
}

while getopts "m:" opt
do
   case "$opt" in
      m ) commitMessage="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

if [ -z "$commitMessage" ]
then
   printf "${RED}No commit message provided${NC}";
   helpFunction
fi

echo $commitMessage

editedOutput=$(git status -s | grep M)
splittedEdited=$(echo $editedOutput | tr "M " "\n")
for singleEdited in $splittedEdited
do
    git add $singleEdited
    git commit -a -m"$commitMessage [M file: $singleEdited]"
done

deletedOutput=$(git status -s | grep D)
splittedDeleted=$(echo $deletedOutput | tr "D " "\n")
for singleDeleted in $splittedDeleted
do
    git add $singleDeleted
    git commit -a -m"$commitMessage [D file: $singleDeleted]"
done

untrackedOutput=$(git status -s | grep ??)
splittedUntracked=$(echo $untrackedOutput | tr "?? " "\n")
for singleUntracked in $splittedUntracked
do
    git add $singleUntracked
    git commit -a -m"$commitMessage [?? file: $singleUntracked]"
done





