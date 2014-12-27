dockerRunner
============

A small docker client helper to run container with saved options in the Dockerfile  
一個簡單的小工具來讓執行 docker container 的指令變簡短

## Why?

When you want to run a docker, In most case, the docker command is very long...

```
# run a bash on debian
docker run -it -v $(pwd):/workspace debian /bin/bash

# run a lnmp
docker run -v $(pwd):/htdoc -p 80:80 -p 3306:3306 -it lnmp56
```

So I write a small script that include the options for the container to run, turning into this:

```
# run a bash on debian
dockerRun debian-bash

# run a lnmp
dockerRun lnmp56
```

## How?

#### To use

 * Git clone this repo: `git clone git@github.com:chgu82837/dockerRunner.git`
 * Install the script executable to your path: `sh <repo_you_just_cloned>/install.sh`
    * It will ask you if you want to `link` the Repo folder to your home folder, `dockerRunner` put Dockerfiles here
 * `dockerRun <imageName_or_dockerPath> [command] [args...]`
    * `imageName` means the Dockerfile (folder) inside the `DOCKER_RUN_FOLDER`, originally locating at `$HOME/.dockerRepo`
    * `dockerPath` means the path just like the path you are using `docker build <path>`, this will use the containing folder as its image name

#### It works

I might explane it other day... I want to sleep now ...  
Check out the `dockerRun` executable on your own XDD
