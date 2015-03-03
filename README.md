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
dockeRun debian-bash

# run a nginx with php56
dockeRun nginx-php56
```

## How ...

### To install?

 * Git clone this repo: `git clone git@github.com:chgu82837/dockerRunner.git`
 * If you are installing on
    * a native unix system (linux, OSX ...):
        * `sh <repo_you_just_cloned>/dockeRun --install`
        * It link the executable to your `/usr/local/bin` / `/usr/bin` / `/bin`, or you can specify by `sh <repo_you_just_cloned>/dockeRun --install [install-destination-dir]`
    * a boot2docker system:
        * `sudo sh <repo_you_just_cloned>/dockeRun --install-b2d [default-dockeRun-imageName]`
        * If you specify the `default-dockeRun-imageName` option, your boot2docker system will auto run the image once you log in, I have the `debian-bash` image built-in, so `sh <repo_you_just_cloned>/dockeRun debian-bash` to auto run the bash env with `docker` and `dockeRun`

### To use ?

 * `dockeRun <imageName_or_dockerPath> [command] [args...]`
    * `imageName` means
        * a folder contains Dockerfile inside the this repo (like `nginx-php56`), it will use the Dockerfile inside the folder to build the image and run
        * a text file inside the this repo (like `debian-bash`, it will use the Dockerfile inside the location specified by string after `dockerRunLink:` in the file content to build the image and run
    * `dockerPath` means the path just like the path you are using `docker build <path>`, this will use the containing folder as its image name
 * To specify the option when runing an image,
    * add a line like `# dockerRun: <option>` to the Dockerfile
    * The `<option>` is the same as `[OPTIONS]` of `docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`, e.g. `# dockerRun: -v $(pwd):/var/www/html -p 80:80`. You can check out my Dockerfile folders inside dockerRepo folder of this repo

### It works ?

Ehh, this script just use sed to dig the `<option>` specified out and help you do the docker run command
Check out the `dockeRun` executable script on your own XDD

## About built-in image

### debian-bash

This image will run a debian bash env with docker from boot2docker system and the dockeRun executable and mount your current location `pwd` to `/workspace` and cd into it

### nginx-php56

This image will run a nginx with php 5.6 and use your current location `pwd` to the html doc root on `/htdoc`
