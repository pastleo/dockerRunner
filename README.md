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

### This script allows you ...

 1. Run a container with params saved in the `Dockerfile` of the line begin with `# dockerRun: `
 2. Run a container at anywhere without creating a `Dockerfile`, just call the container name
    1. Then the folder mounting (usually the dev folder) can be preset inside the `Dockerfile`, yeah!
 3. Place a `Dockerfile` template so you can start a project more easizer

## How ...

### To install?

 * Git clone this repo: `git clone git@github.com:chgu82837/dockerRunner.git`, and place the folder to a place you want to keep (the installation only links `dockeRun` execuatble to your path)
 * If you are installing on
    * a native unix system (linux, OSX ...):
        * `sh <repo_you_just_cloned>/dockeRun --install`
        * It link the executable to your `/usr/local/bin` / `/usr/bin` / `/bin`, or you can specify by `sh <repo_you_just_cloned>/dockeRun --install [install-destination-dir]`
    * a boot2docker system:
        * `sudo sh <repo_you_just_cloned>/dockeRun --install-b2d [default-dockeRun-imageName]`
        * If you specify the `default-dockeRun-imageName` option, your boot2docker system will auto run the image once you log in, I have the `debian-bash` image built-in, so `sh <repo_you_just_cloned>/dockeRun debian-bash` to auto run the bash env with `docker` and `dockeRun`

### To use ?

```
dockeRun - dockerRunner exec by /usr/local/bin/dockeRun
===============================================
A small docker client helper to run container with saved options in the Dockerfile
Usage:
    dockeRun [--rebuild|-r] <imageName_or_projectPath> [command] [args...] # build and run the container
    dockeRun --template|-t [templateName] [projectPath] # place the Dockerfile template to the projectPath, or list templates
    dockeRun --list|-l # list availible configs
    dockeRun --help|-h # show this help message
    dockeRun --install [install-destination-dir] # install to normal unix system
    dockeRun --install-b2d [default-dockeRun-imageName] # install to boot2docker system
```

#### Run a dockeRun config

 1. To get availible configs, run `dockeRun -l`
 2. Select the config you need from listed config, see *About built-in dockeRun configs* below for more info
 3. `dockeRun <imageName_or_dockerPath> [command] [args...]`
    * `imageName` means
        * a folder contains Dockerfile inside the this repo (like `nginx-php56`), it will use the Dockerfile inside the folder to build the image and run
        * a text file inside the this repo (like `debian-bash`, it will use the Dockerfile inside the location specified by string after `dockerRunLink:` in the file content to build the image and run

#### Use dockeRun template

 1. Run `dockeRun -t` to see availible templates
 2. Select the template you need from listed template, see *About built-in dockeRun template* below for more info
 3. Run `dockeRun -t <templateName> [projectPath]` to place the template `Dockerfile` into the `projectPath` or your current location if not specified
 4. `dockeRun <imageName_or_dockerPath> [command] [args...]`
    * `dockerPath` means the path where `Dockerfile` is located (usually `./`), just like the path you are using `docker build <path>`, this will use the containing folder as its image name

#### To specify the option when runing an image

 * Add a line like `# dockerRun: <option>` to the Dockerfile
 * The `<option>` is the same as `[OPTIONS]` of `docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`, e.g. `# dockerRun: -v $(pwd):/var/www/html -p 80:80`. You can check out my Dockerfile folders inside dockerRepo folder of this repo

## About built-in images

### DockeRun configs

 * cplusplus-dev: [c++](http://en.cppreference.com/) development, providing shell with `g++` to compile and execute
 * debian-bash: just a bash environment in debian
 * golang: [go-language](https://golang.org/) development, providing shell to compile and execute
 * laravel-dev: [laravel](http://laravel.com/) development, providing shell to compile and execute
 * nginx-php56: A nginx with php56 and use your current location `pwd` to the html doc root on `/htdoc`
 * node: [nodejs](https://nodejs.org/) development, providing shell with `node` to run
 * python2: [python2](https://www.python.org/) development, providing shell with `python` to run
 * python3: [python3](https://www.python.org/) development, providing shell with `python` to run
 * ruby_or_rails: [ruby](https://www.ruby-lang.org/) or [rails](http://rubyonrails.org/) development, providing shell with `ruby` / `irb` / `rails` to run, `s` to `rails s -b 0.0.0.0` and `l` to `less +F /var/log/rs.log`
 * slideshow-pastpress: a shell with [slideshow](http://slideshow-s9.github.io/index.html) which I use to create my slides with my own theme [pastpress](https://github.com/chgu82837/PastPress)

### DockeRun template

 * golang: [go-language](https://golang.org/) development with `Godeps` (used by [gpm](https://github.com/pote/gpm)) to customize packages you need, providing shell to compile and execute
 * node: [nodejs](https://nodejs.org/) development with `package.json` (used by [npm](https://www.npmjs.com)) to customize packages you need, providing shell to run
 * python2: [python](https://www.python.org/) development with `requirements.txt` (used by [pip](http://pip.readthedocs.org)) to customize packages you need, providing shell to run
 * python3: [python](https://www.python.org/) development with `requirements.txt` (used by [pip](http://pip.readthedocs.org)) to customize packages you need, providing shell to run
 * ruby_or_rails: [ruby](https://www.ruby-lang.org/) or [rails](http://rubyonrails.org/) development with `Gemfile` (used by [gem](https://rubygems.org)) to customize packages you need, providing shell with `ruby` / `irb` / `rails` to run, `s` to `rails s -b 0.0.0.0` and `l` to `less +F /var/log/rs.log`
