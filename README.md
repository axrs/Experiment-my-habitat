# Experiment

> Habitat was an experiement which aimed to dockerise (with configuration persistance) my entire development environment.
> The aim was to be able to quickly setup my environment on any machine running docker, regardless of base operating system.
> The environments would then be able to be configured on a project, or organisation basis.
>
> What I hit however was performance and X-11 rendering resolution issues. The required machine hardware to be productive
> simply didn't outweigh the maintenance of simple dotfiles.

# My Habitat

My [Dockerised](https://docker.com) Developer Environment based on
[habitat](https://github.com/ardourtech/habitat) and
[habitat-cli](https://github.com/ardourtech/habitat-cli)

## Using

### Configuration

1. Configure a new Environment by creating a Dockerfile and scripting dependency installation
1. Build the environment using the `habitat-cli`

### Development

1. Start the configured Environment by specifying the container and giving it a name.
1. Connect into the Environment, and run necessary commands.
1. Once finished, Stop the Environment by Name to free up host resources.

## Commands

### Building an Environment

> Note: `$HABITAT_USER` and `$HABITAT_USER_PASSWORD` docker arguments will be
> provided (and prompted for) by the `habitat-cli`

```shell
# Windows
habitat.exe build \
  --user axrs \
  --directory . \
  --file .\<env-name>\Dockerfile \
  --tag my-habitat

# MacOS/Unix
habitat build \
  --user axrs \
  --directory . \
  --file ./<env-name>/Dockerfile \
  --tag my-habitat
```

### Starting an Environment

```shell
# Windows
habitat.exe start --image <image-name>:<tag> --name <env-name> --with-x11-display --with-docker

#MacOS/Unix
habitat start --image <image-name>:<tag> --name <env-name> --with-x11-display --with-docker
```

### Connecting into the Environment

```shell
# Windows
iex "$(habitat.exe connect --name <env-name>)"

# MacOS/Unix
eval "$(habitat connect --name <env-name>)"
```

## Project Structure

```text
.
|   README.md
|   
+---dotfiles                ; User $HOME configuration files which will be 
|       .gitconfig          ; copied directly to $HOME directory within the
|                           ; Docker container
|               
+---home                    ; My Default Environment
|       Dockerfile
|       
+---jesi-env                ; My JESI specific Environment with any additional
|       Dockerfile          ; configuration scripts
|       *.sh
|       
\---scripts                 ; Common configuration scripts used by multiple
    |   *.sh                ; environments
    |   
    \---as_root             ; Scripts intended to be run as the `root` user
            *.sh            
```
