# Twelve Factor Application Demo (Incomplete)
This is a demonstration of a web application with supporting services, like the ones that I have typically used in previous work. I created this from scratch to better demonstrate the skills that I list on my resume and in my previous work experience.

I'm still in the process of building this in my free time, so it is currently incomplete. Once this is complete, I'll remove this disclaimer. Please check back to see further progress in the meantime!

## Running the Demo
This demo uses Docker with docker-compose so, if you have Docker Desktop installed, you can run this demo to see it in action. The `start.sh` script performs a docker-compose up and includes all of the structured compose yml files needed.

You'll need either a native bash/sh shell on Linux/Mac OSX (like the Terminal program) or a program that emulates a bash shell on Windows (like Git Bash, which is included with the Windows Git client, or Cygwin). In that program, navigate to the directory where you've cloned this repo or unzipped a download of this repo's files, and type:

`./start.sh`

## Reviewing the Source Code
To assist with reviewing the placement of things in the source, here's a breakdown of the code locations in the repository:

- The `config` folder is responsible for holding config files for Docker container services, like a MariaDB's or Nginx's conf file.
  - This folder also contains docker-compose's environment variables, and would theoretically hold any other variables in a config-style format.
  - These configs are stored separately from the Docker folders/files because these configs are also usable in cases that don't involve Docker.
- The `docker` folder holds the bulk of the Docker-specific files. You'll find things such as:
  - The docker-compose yml files for each grouping of services, which are all referenced at docker-compose up in the start.sh script.
  - The Dockerfiles for each container that needs a custom build process, which are separated in the `build` subfolder.
    - Any related scripts, files, etc. will also be in the build subfolders to keep them close to the Dockerfile, as some of these files are copied into the container.
- The `src` folder contains all of the application source files that are needed for any web servers, websocket servers, etc.

## Leaving Feedback
Have ideas on things you'd like to see in this demo? Add an issue on this Github repository! I'd love to demonstrate more sought-after skills here.
