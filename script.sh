#!/bin/bash

#APP COSTANTS
APPVERSION=1.0
DAYSINAYEAR=1

#COLOR COSTANTS
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

#app variables
shouldPush=0

helpFunction()
{
   printf "\n${NC}Usage: $0 -m\"My nice feature\" [-p] [-fake]"
   printf "\n${NC}\t -m'My nice feature' -> ${GREEN}base commit message${NC}"
   printf "\n${NC}\t -v -> ${GREEN}return the version${NC}"
   printf "\n${NC}\t -p -> ${GREEN}push after the commit${NC}"
   printf "\n${NC}\t -f -> ${GREEN}create last year fake empty commits in your repo${NC}\n"
   exit 1 # Exit script after printing help
}

versionFunction()
{
   printf "${GREEN}FYGS v$APPVERSION${NC}\n"
   exit 1
}

checkCommitMessageFunction()
{
   if [ -z "$commitMessage" ]
   then
      printf "${RED}No commit message provided${NC}\n";
      helpFunction
   fi
}

pushFunction()
{
   if [ "$shouldPush" -eq "1" ];
   then
      if git push --force ; then
         printf "${GREEN}push done${NC}\n"
      else
         printf "${RED}push failed${NC}\n"
      fi
      
fi
}

fakeFunction()
{
   checkCommitMessageFunction
   if [[ "$OSTYPE" == "darwin"* ]]; then
      if ! type gdate ; then
         if type brew ; then
            printf "${RED}sorry you need to have gdate to use this command, installing it with brew${NC}\n"
            brew install coreutils
            date() { if type -t gdate &>/dev/null; then gdate "$@"; else date "$@"; fi }
         else 
            printf "${RED}sorry for use this command you have to install gdate${NC}\n"
            exit 0
         fi
      else
         date() { if type -t gdate &>/dev/null; then gdate "$@"; else date "$@"; fi }
      fi
      if ! type gdate ; then
         printf "${RED}sorry for use this command you have to install gdate${NC}\n"
         exit 0
      fi
   fi
   
   for (( d=0; d<=$DAYSINAYEAR; d++ ))
      do 
         actualDate=$(date -d "now -$d days")
         randomNumberOfCommits=$((1 + $RANDOM % 5))
         for (( i=1; i<=$randomNumberOfCommits; i++ ))
            do
               git commit --allow-empty --date="$actualDate" -m"$commitMessage [Fake: commit $i date: $actualDate]"
               git commit --amend --no-edit --allow-empty --date="$actualDate" 
            done
      done
   
   printf "${GREEN}FYGS have successfully fucked your stats!${NC}\n"
   pushFunction
   exit 1
}


while getopts "m:vpf" opt
do
   case "$opt" in
      v ) versionFunction ;;
      m ) commitMessage="$OPTARG" ;;
      p ) shouldPush=1 ;;
      f ) fakeFunction ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

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

pushFunction

exit 1