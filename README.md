# README

This repository contains systems engineering practices normative documents for information systems , it's not indeed to replace any engineering standards but serves as guideline to be applied in programs and projects.

## Purpose

This repository was designed to be used on a systems engineering guidelines for existing or new business information systems development and operation.

Scope is limited to business, people, abstractions and information systems programs. More formal or purely physical applications are not covered.

This repository is intended to be read as-is from the 'Documents' directory, from a web based 'Sphinx' documentation, or distributed as an deployed python package or as reference material.

## Current Status

This repository is a work in progress , so still requires a more formal engineering structure to be applied.

Also, lacks for tools to validate the guidelines.

## Requirements

If you only want to read without build , [VS Code](https://code.visualstudio.com/) or [https://obsidian.md/](Obsidian) software is enough, see the section [Usage](#usage) below for instructions.

If you want to to distribute, read on web or build as '[Sphinx](https://www.sphinx-doc.org/)' documentation the follow requirements are mandatory:

-   GNU 'Make' , most available in Linux distributions it's required to process the build workflow.
-   [Docker](https://www.docker.com/) in their Desktop or Server version , this repository was successful tested with Docker server 20.10 and should work in version later. It's mandatory to manage python's requirements , otherwise you can execute the build process directly.

If you want to build without a Docker, then GNU 'Make', [https://www.python.org/](Python) 3.8 or later it's mandatory, handling python requirements is described in [Building](#building) process. For documents lint you must use [https://nodejs.org](Node.js) v20.13 LTS or later.

## Usage

This repository contains textual guidelines , no automated tools are provided to follow the guidelines.

-   For a quick use VSCode or Obsidian software can be used for reading or editing content, just use your software to open the '_Documents_' directory.

-   For publishing or distribution you need to build the 'Sphinx' documentation into 'Builds' directory. The section '[Building](#building)' describes how to build the documentation or distribute as Python package.

## Building

The builds creates an 'Sphinx' documentation into 'Builds' directory , these documentation serve as bases for reading from a web browser, publishing or distribution.

The builds it's made entirely into a Docker container for better requirements control.

The most simple build it's to create a 'Sphinx' documentation to be read directly from the 'Builds' directory using the command below

```sh
make build-on-docker
```

As alternative you can build the 'Sphinx' documentation without the docker container using the command bellow, but ensure you have read [Requirements](#requirements) section before.

```sh
make build
```

To read or publish in the web as 'Sphinx' documentation the command below deploy a docker container

```sh
make web-on-docker
```

To distribute as python package using Docker use the command below

```sh
make pack-on-docker
```

## Contributing

Anyone can contribute, you can use VSCode to edit the document and send a 'request push' on Github to <https://github.com/alvaro-osvaldo-tm/Normative-Documents> , you collaboration will be appreciated.

New Obsidian configuration plugins will only be careful allowed to merge due security constraints.

## Further Work

-   For future releases it's expected that this repository grows in maturity and include conceptual operations and automatic tools for validations.

-   Automatic container deployment will be implemented using 'Buildbot'.

-   The build process was made for an old and stable python version , but newer versions available in popular Linux distributions and the newer Python version should be validated.
