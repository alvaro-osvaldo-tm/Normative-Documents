# README

This repository contains systems engineering practices normative documents for information systems , it's not indeed to replace any engineering standards but serves as guideline to be applied in programs and projects.

## Additional information

Specific modules documentation in this repository is found below:

-   [Taxonomy](Taxonomy/README.md): Describes the repository's artefacts classification.
- [Viewpoints](Viewpoints/README.md): Describes groups of concerns in this repository.
-   [Externals](Externals/Externals.md): Describes useful externals artefacts.


## Purpose

This repository was designed to be used on a systems engineering guidelines for existing or new business information systems development and operation.

Scope is limited to business, people, abstractions and information systems programs. More formal or purely physical applications are not covered.

his repository is intended to be read as-is from directories.

## Current Status

This repository is a work in progress , so still requires a more formal engineering structure to be applied.

Also, lacks for tools to validate the guidelines.

It's possible to read the next features to be released in [Roadmap](#roadmap) section.

## Requirements

-   For read or edit , [VS Code](https://code.visualstudio.com/) or [https://obsidian.md/](Obsidian) software is enough.

-   For development, a lint is avaliable for usage, it will require to use `GNU Make` and [https://nodejs.org](Node.js) v20.13 LTS or later.

## Usage

This repository contains textual guidelines , no automated tools are provided to follow the guidelines.

-   For a quick use VSCode or Obsidian software can be used for reading or editing content, just use your software to open the repository.

-   For development, a Makefile workflow document is available , only execute `make all` into a terminal for linting execution. Or `make all-on-docker` to run the linter under a docker container.

## Contributing

Anyone can contribute, you can use VSCode to edit the document and send a 'request push' on Github to <https://github.com/alvaro-osvaldo-tm/Normative-Documents> , you collaboration will be appreciated.

New Obsidian configuration plugins will only be careful allowed to merge due security constraints.

## Roadmap

-   For future releases it's expected that this repository grows in maturity and include conceptual operations and automatic tools for validations.

-   Automatic container deployment will be implemented using 'Buildbot'.

-   The build process was made for an old and stable python version , but newer versions available in popular Linux distributions and the newer Python version should be validated.

-   [Obsidian](Tools/Management/Knowledge%20Management/Information%20Capture/Obsidian.md) support will be constrained in favor to [WikiJS](Tools/Management/Knowledge%20Management/Information%20Capture/WikiJS.md) or other low-cost alternative to support better multi-user editing and git storage.

### Current release

### 0.0.1

Release basic build and documentation support.

-   [ ] Support documentation's build with Sphinx.
-   [ ] Build pipeline with Buildbot.
    -   [ ] Support Linter.
    -   [ ] Support Changelog file.
-   [ ] Support basic systems engineering practice.
-   [x] Basic support for Taxonomy
    -   [x] Taxonomy structure
    -   [ ] Taxonomy's elements identification
- [ ] Fix document's links.

### 0.2.0

Support collaborative and better editing

-   [ ] Minimal [WikiJS](Tools/Management/Knowledge%20Management/Information%20Capture/WikiJS.md) support.

### 0.3.0

Release requirements engineering

-   [ ] Support systems engineering practice.
    -   [ ] Support Requirements gathering practice
- [ ] Better support for viewpoints.

### 0.4.0

Release security support

-   [ ] Support advanced security configuration as:
    -   [ ] AppArmor
    -   [ ] Seccomp
    -   [ ] Capabilities
-   [ ] Support secrets management
-   [ ] Support configuration for Docker User-namespace mapping
-   [ ] Support resources management in application for security purposes
    -   [ ] Prevent a fork bomb
    -   [ ] Manage CPU usage and Affinity
    -   [ ] Manage Disk IO usage
-   [ ] Support to running untrusted applications
-   [ ] Support to audit untrusted applications.
-   [ ] Support vulnerability scanning
    -   [ ] Scanning in Docker images
-   [ ] Check viability for [The Update Framework](https://theupdateframework.io/)

### 0.5.0

Release with a simple document management system.

-   [ ] Allow to execute procedure into WikiJS
    -   [ ] Including checklists

### 0.6.0

Release business support.

-   [ ] Support for system and business architecture definition.


### Further releases

### System documents

Define a set of documents and deliverables to be released for the [stakeholders](Roles/Project/Stakeholders/Project%20Stakeholder%20Role.md) and [engineering team](Roles/Engineering/Engineering%20Role.md) for [Project Management](Taxonomy/Management/Project%20Management/Project%20Management.md).

- Result Demonstration
	- [ ] Define the [Changelog](Taxonomy/Engineering/Software%20Engineering/Software%20Release/Changelog.md) as a result document deliverable.
- Quality Demonstration
	- [ ] Define how to mesure 

### Data science support

Support data science and business intelligence projects.

- Scope definition
	- Structural Analysis
	- Taxonomy and Thesaurus
- Checklists
	- Which question the dashboard need to answer ?
	- Which will be the read-only fields?
	- Which will data input fields?
	- Which domains the fields will be ?
- Guidelines
	- Design
		- Presentation
			- Center the main decision indicators
			- Fill alerts in red
			- Define the presentation design standard


