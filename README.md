# My Habitat

My Dockerised Developer Environment based on
[habitat](https://github.com/ardourtech/habitat) and
[habitat-cli](https://github.com/ardourtech/habitat-cli)

## Building an Environment

### Windows

```shell
habitat.exe build \
  --user axrs \
  --directory . \
  --file .\<env-name>\Dockerfile \
  --tag my-habitat
```

### MacOS/Linux

```shell
habitat build \
  --user axrs \
  --directory . \
  --file ./<env-name>/Dockerfile \
  --tag my-habitat
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
