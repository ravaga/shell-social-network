#!/bin/bash

# Creates a new social network
function create() {
        echo Creating a new social network
        # create gitignore
        touch .gitignore
        cat sn >> .gitignore
        cat sn.sh >> .gitignore
        # append the new and unique member's info to members.txt
        touch members.txt
        { git config --get user.email & git config --get user.name; } | sed ':a;N;s/\n/ /;ba' >> members.txt
        # create the necessary files and folders
        mkdir posts
        touch follows.txt
        touch likes.txt
        #init Git repository
        git init
}

# Joins to an existing social network indicated by the user with an url
function join() {
        # copy all the social network's files into the local filesystem 
        git clone $1 .
        # write the new member to members.txt
        { git config --get user.email & git config --get user.name; } | sed ':a;N;s/\n/ /;ba' | cat >> members.txt
        echo You are a new member of this social network!
}

# Pulls in new posts and likes
function pull() {
        git pull
}

# Show a list of existing posts
function log() {
        # show only the file name, which is the post title
        ls posts | sed 's/\.txt[^.]*$//'
}

# Shows a specified post
function show() {
        cat posts/$1.txt
}

# Posts a new story
function post() {
        # create the file
        touch posts/$1.txt
        # First line -> Title: post_title
        echo "Title: $1" > posts/$1.txt
        echo >> posts/$1.txt
        # Second line -> Author: post_author_email
        email=$(git config --get user.email)
        echo "Author: $email" | cat >> posts/$1.txt
        echo >> posts/$1.txt
        # Finally -> post content
        echo $2 >> posts/$1.txt
        cat >> posts/$1.txt $2
}

# Like a specified post
function like() {
        email=$(git config --get user.email)
        echo "$1 $email" >> likes.txt
}

# Pushes locally made changes back to the server
function push() {
        # first, pulls to the local repository the changes made by other members
        pull
        # then, pushes the changes to the server
        git add .
        git commit -m "$2"
        git push -u origin master
}

# Shows the network's members
function members() {
        cat members.txt
}

# Runs the command introduced by the user
function selectCommand() {
        # check if is the user introduced a subcommand
        if [[ -z "$1" ]]; then
                echo -e "error: enter a valid subcommand\n"
                exit 1
        fi

        # check if is the user introduced a valid subcommand and run the function that executes the subcommand
        case $1 in
        create) create ;;
        join) join $2 ;;
        pull) pull ;;
        log) log ;;
        show) show $2 ;;
        post) post $2 ;;
        like) like $2 ;;
        push) push $2 ;;
        members) members ;;
        *) echo -e "error: enter a valid subcommand\n" ;;
        esac
}

selectCommand "$@"
