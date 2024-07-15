# Bash Container

An Bash runtime container to operate and develop Bash scripts in isolation.

## Ratione

Usefull avoid expose other files than necessary for a script that manipulate files.

Because a script that manipulate files can be a huge risk if can access the whole user's developer files.

## Usage

The container will try to run an '/app/main.sh'  script , **it's necessary that the script be an executable** ( `chmod +x main.sh` ) , otherwise the execution will fail.

It's possible to send arguments to the scripts simple putting putting the desired parameters when running the script.

If need, it's possible to change the script made for execution changing the parameter entrypoint `--entrypoint`.

These cases are exampled below.

```bash
# Rember the script need be executable to run.

# To mount the current directory on /app and run a 'main.sh'.
$ docker run -it --rm -v "$PWD":/app local/bash:0.0.0

# To mount the current directory on /app and run a 'main.sh' with parameters.
$ docker run -it --rm -v "$PWD":/app local/bash:0.0.0 --parameter-01 --parameter-02

# To run 'your-script.sh' rather than 'main.sh' in '/app', parameters can be included if need.
$ docker run -it --rm -v "$PWD":/app --entrypoint your-script.sh local/bash:0.0.0

# To execute 'your-script.sh' without mount the '/app' directory.
$ docker run -it --rm -v "$PWD/your-script.sh":/app/main.sh:ro local/bash:0.0.0

```

If need to interact with a Bash shell without run any script, you can use the bash parameter '`-i`' as show below:

```bash
# To execute 'your-script.sh' without mount the '/app' directory
$ docker run -it --rm -v "$PWD":"/app" local/bash:0.0.0 -i
```

## Production Image

It's a simples Bash interpreter image, with no special add-ons.

## Development Image

It's an image for development purposes, include the applications:

- entr
- bat
- git
- Bash Debugger

## Contributing

There is a directory `container/install/development` to add mode complex development image installations.

For production images the directory `container/install/production` exists for same purpose.

For other cases the `container/Dockefile` can be used , there is two targets , one to generate a __production image__ and other to generate a __development image__.

Both images can be genareted useing the `Makefile` workflow , there is a task named '_build-all_'  to generate both images. Also there is a task named '_build-production_' to build only the production image and'_build-development_' to build the develpoment image.

No '`docker-entrypoint.sh`' script was incorporated to keep the image use cases simple.