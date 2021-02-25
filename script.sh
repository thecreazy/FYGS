#!/bin/bash

#APP COSTANTS
APPVERSION=1.0

#COLOR COSTANTS
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

#app variables
shouldPush=0

helpFunction()
{
   printf "\n${NC}Usage: $0 -m\"My nice feature\""
   printf "\n${NC}\t -m'My nice feature' -> ${GREEN}base commit message${NC}"
   printf "\n${NC}\t -v -> ${GREEN}return the version${NC}"
   printf "\n${NC}\t -p -> ${GREEN}push after the commit${NC}"
   exit 1 # Exit script after printing help
}

versionFunction()
{
   printf "${GREEN}FYGS v$APPVERSION${NC} "
   exit 1
}

while getopts "m:vp" opt
do
   case "$opt" in
      v ) versionFunction ;;
      m ) commitMessage="$OPTARG" ;;
      p ) shouldPush=1 ;;
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

printf "${GREEN}commit: ${RED}[$commitMessage]${GREEN} done :) enjoy your pumped stats${NC}\n";

if [ "$shouldPush" -eq "1" ];
then
   if git push --force ; then
      printf "${GREEN}push done${NC}\n"
   else
      printf "${RED}push failed${NC}\n"
   fi
   
fi

exit 1
