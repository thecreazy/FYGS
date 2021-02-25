#!/bin/bash


edited_output=$(git status -s | grep M)
splitted_edited=$(echo $edited_output | tr "M " "\n")
for single_edited in $splitted_edited
do
    git add $single_edited
    git commit -a -m"edited [M file: $single_edited]"
done

deleted_output=$(git status -s | grep D)
splitted_deleted=$(echo $deleted_output | tr "D " "\n")
for single_deleted in $splitted_deleted
do
    git add $single_deleted
    git commit -a -m"deleted [D file: $single_deleted]"
done

untracked_output=$(git status -s | grep ??)
splitted_untracked=$(echo $untracked_output | tr "?? " "\n")
for single_untracked in $splitted_untracked
do
    git add $single_untracked
    git commit -a -m"added [?? file: $single_untracked]"
done





