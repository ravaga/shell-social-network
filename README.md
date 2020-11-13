# Shell social network
Social network example for the Progress Assessment 5 of the edX course named "Unix Tools: Data, Software and Production Engineering" 

Includes the bash script named "sn.sh". For testing purposes, please move the script to another folder and include it in the system PATH.

## Create a new social network

Please, run this command inside an empty directory

Creates a new social network inside the current directory with you as the unique member

    sn create

## Join existing social network

Please, run this command inside an empty directory

    sn join <Git_repository_url>

### Example

    sn join https://github.com/ravaga/shell-social-network

## Pull in new posts and likes

Retrieves new posts and likes from the server and updates the local information

    sn pull

## Show a list of existing posts

    sn log

## Show a specified post

    sn show <post_title>

### Example

    sn show amazing-post

## Post a new story

Spaces are not allowed in post titles

    sn post <post_title> <post_content>

### Example

    sn post The_Linux_shell << EOF

    In this post, we are going to explain some features about the Linux shell
    For example, ...

    EOF


Each posts has its own txt file inside the folder called posts. A post file is composed by a line indicating the title, followed by a line that includes the author's email and finally includes the post content.

## Like a specified post

    sn like <post_title>

In the file likes.txt there is a relation of posts liked by users. Each line of the file includes the post name and the member's email that liked the post


## Push locally made changes back to the server

    sn push <commit_message>

### Example

    sn push example_commit

## Show the network's members

    sn members

In the file members.txt there is a relation of social network's members. Each line of the file includes the member's username and email


## Social network example

For testing purposes, we have implemented a simple social network and uploaded to GitHub (https://github.com/ravaga/shell-social-network)

## License
Apache 2.0