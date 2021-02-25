#!/bin/bash

#COLOR COSTANTS
RED='\033[0;31m'
GREEN='\033[0;32m'
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

editedOutput=$(git status -s | grep "M ")
splittedEdited=$(echo $editedOutput | sed 's/M /\n/g')
for singleEdited in $splittedEdited
do
   git add $singleEdited
   git commit -m"$commitMessage [M file: $singleEdited] $singleEdited"
done

deletedOutput=$(git status -s | grep "D ")
splittedDeleted=$(echo $deletedOutput | sed 's/D /\n/g')
for singleDeleted in $splittedDeleted
do
    git add $singleDeleted
    git commit -m"$commitMessage [D file: $singleDeleted] $singleDeleted"
done

untrackedOutput=$(git status -s | grep "?? ")
splittedUntracked=$(echo $untrackedOutput | sed 's/?? /\n/g')
for singleUntracked in $splittedUntracked
do
    git add $singleUntracked
    git commit -m"$commitMessage [?? file: $singleUntracked] $singleUntracked"
done

printf "${GREEN}commit: ${RED}[$commitMessage]${GREEN} done :) enjoy your pumped stats${NC}";
