# Bash Container

A runtime container to operate and develop Bash scripts in isolation.

## Purpose

Offer an standarized image base for both Bash execution and development that can be executed isolated from the develoment or production overwall environment.

## Rationale

Scripts that manipulate files can presente a huge risk if can acess the overwall production or development files.

A mistake in the script can modify or delete unwanted files.

In an isolated environment as is a Docker container, it's possible to configure de more granular file and systemcalls permissions , protecting the system files from being manipulated by a buggous script.

## Usage

The container will try to run an '/app/main.sh' script , **it's necessary that the script be an executable** ( `chmod +x main.sh` ) , otherwise the execution will fail.

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

-   entr: To re-execute a script when it's changes.
-   bat: To test Bash scripts.
-   Bash To debug bash scripts.
-   git: For version control mangement.

### Developing as daemon

If it's need to keep a container active even if no script is running , as when developing a script using VSCode in remote connection, you can run the container as a dameon configuring the entrypoint as '`tail`' withe paramter '`-f /dev/null`'. It will keep the container waiting 'for nothing' until being finished as the command below shows.

```bash
# Run as daemon
$ docker run -d --rm -v "$PWD":/app --entrypoint tail local/bash:0.0.0 -f /dev/null
```

To finish you need to get the container id with `docker ps` and use it to terminate the daemon as show below.

```bash
# Get the container id
$ docker ps
...

# Terminate the daemon program , '-t 0' means to do immediate
$ docker stop -t 0 <id>
```

## Contributing

There is a directory `container/install/development` to add mode complex development image installations.

For production images the directory `container/install/production` exists for same purpose.

For other cases the `container/Dockefile` can be used , there is two targets , one to generate a **production image** and other to generate a **development image**.

Both images can be genareted useing the `Makefile` workflow , there is a task named '_build-all_' to generate both images. Also there is a task named '_build-production_' to build only the production image and'_build-development_' to build the develpoment image.

No '`docker-entrypoint.sh`' script was incorporated to keep the image use cases simple.
