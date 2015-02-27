dockerRunner
============

A small docker client helper to run container with saved options in the Dockerfile  
一個簡單的小工具來讓執行 docker container 的指令變簡短

## Why?

When you want to run a docker, in most case, the docker command is very long...

```
# run a bash on debian
docker run -it -v $(pwd):/workspace debian-bash /bin/bash

# run a nginx with php56
docker run -v $(pwd):/htdoc -p 80:80 -it nginx-php56
```

So I write a small script that include the options for the container to run, turning into this:

```
# run a bash on debian
dockeR debian-bash

# run a nginx with php56
dockeR nginx-php56
```

## How ...

#### To use ?

 * Git clone this repo: `git clone git@github.com:chgu82837/dockerRunner.git`
 * Install the script executable to your path: `sh <repo_you_just_cloned>/dockeR --install`
    * It link the executable to your `/usr/local/bin` / `/usr/bin` / `/bin`, or you can specify by `sh <repo_you_just_cloned>/dockeR --install [install-destination-dir]`
 * `dockeR <imageName_or_dockerPath> [command] [args...]`
    * `imageName` means the Dockerfile folder inside the `DOCKER_RUN_FOLDER`, originally locating at `$HOME/.dockerRepo`
    * `dockerPath` means the path just like the path you are using `docker build <path>`, this will use the containing folder as its image name
 * You can specify your Dockerfile own your own,
    * create a folder under the `DOCKER_RUN_FOLDER`, originally locating at `$HOME/.dockerRepo`, if you want to use `imageName` to run it; or put to whatever location, if you want to use `dockerPath` to run it.
    * put your Dockerfile inside the folder you just created, write it with [Dockerfile Syntax](https://docs.docker.com/reference/builder).
    * *And this is important*, add a line like `# dockerRun: <option>` and the `<option>` is the same as `[OPTIONS]` of `docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`, e.g. `# dockerRun: -v /home/user/workspace:/var/www/html -p 80:80`. You can check out my Dockerfile folders inside dockerRepo folder of this repo

#### It works ?

Ehh, this script just use sed to dig the `<option>` specified out and help you do the docker run command
Check out the `dockeR` executable script on your own XDD

### To install for boot2docker

Just `sh <repo_you_just_cloned>/dockeR --install-b2d [default-dockeR-imageName]`  

If you specify the `default-dockeR-imageName` option, your boot2docker system will auto run the image once you log in, I have the `debian-bash` image built-in, so `sh <repo_you_just_cloned>/dockeR debian-bash` to auto run the bash env with `docker` and `dockeR`

## About built-in image

### debian-bash

This image will run a debian bash env with docker from boot2docker system and the dockeR executable and mount your current location `pwd` to `/workspace` and cd into it

### nginx-php56

This image will run a nginx with php 5.6 and use your current location `pwd` to the html doc root on `/htdoc`
