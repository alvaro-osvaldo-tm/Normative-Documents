# FullStack Home Lab

It's a FullStack plataform following systems engineering practices, mainly focused for information systems processing. It's evolving into a platform engineering practice but oriented to support small solutions common found in home lab experiments insted to become a enterprise-grade plataform.

It's not replace or have the inteed to replace a more robust plataform as [Kuberflow](https://www.kubeflow.org/) or public-cloud services, but serves as a quick and low-cost platform.

## Usage

This repository contains textual guidelines , no automated tools are provided to follow the guidelines.

-   For a quick use VSCode or Obsidian software can be used for reading or editing content, just use your software to open the repository.

-   For development, a Makefile workflow document is available , only execute `make all` into a terminal for linting execution. Or `make all-on-docker` to run the linter under a docker container.

## Requirements

-   For read or edit , [VS Code](https://code.visualstudio.com/) or [https://obsidian.md/](Obsidian) software is enough.

-   For development, a lint is avaliable for usage, it will require to use `GNU Make` and [https://nodejs.org](Node.js) v20.13 LTS or later.

## Repository Purpose

The repository handles the need to deploy small business intelligence and data science programs, not only the computational side but also physical and business side.

Due the small scope of these programs paying for a cloud provider services it's not desired due some programs are for experimentation.

But it's not desired to get away from good practices or constraint the program evolution to an enterprise-class program, so

This repository was designed to be used on a systems engineering guidelines for existing or new business information systems development and operation.

Scope is limited to business, people, abstractions and information systems programs. More formal or purely physical applications are not covered.

his repository is intended to be read as-is from directories.

## Additional information

This repository follows systems engineering practices , there is no need to go deep in these field these practices exists mainly to keep this repository on track of their objectices, if you whant to understand these practices more deep the main documents are referenced below:

-   [Stakeholder Requirement Document](Specification/SRD%20-%20Stakeholder%20Requirements%20Document.md).

If you are interested in understanding the fundamentals of systems engineering practices, you might find the following book and course from MIT OpenCourseWare enjoyable.

-   [Crawley, E., Cameron, B., Selva, D. (2016). System Architecture: Strategy and Product Development for Complex Systems. United Kingdom: Pearson.](https://www.google.com.br/books/edition/System_Architecture/67TuoQEACAAJ?hl=en)
-   [Fundamentals of Systems Engineering at MIT OpenCourseware , professor Olivier de Weck ](https://ocw.mit.edu/courses/16-842-fundamentals-of-systems-engineering-fall-2015/video_galleries/class-videos/)

### Slices

Slices are concepts that segments the taxonomy in artefacts based the [SPEM](https://www.omg.org/spec/SPEM/2.0/About-SPEM), [Archimate 3](https://pubs.opengroup.org/architecture/archimate3-doc/index.html) and [TOGAF](https://www.opengroup.org/togaf/10thedition) meta-models , this repository not enforce the SPEM usage or meta-model , but simplifies and enhance their elements definitions.

The slices and their meanings are described below:

-   Motivation: Describes why the taxonomy entity do for the system
    -   Outcome: An expected strategic deliverable result, normally non-tangible.
    -   Role: An expected behaviour on organisation.
    -   Responsibilities:
    -   Viewpoint: Represents a set of concerns for a role.
    -   Case: Describes how the system interacts
    -   Value: The relative worth for the system
-   Logical: Describes what the taxonomy entity do for the system
    -   Activities: Represents a generic basic unit of work,
    -   Events: Describes a change in system states
        -   Phase: Indicate a significant state for the system that orient the overall work.
        -   Milestone: Indicates an significant result in the system was archived.
        -   Exception: Indicates a non-normal state for the system.
        -   States: Any other system states.
-   Technical: Describes how the use can do a behaviour on the taxonomy entity
    -   Guideline: A document that can be useful to follow or guidance
    -   Metric: A standard measurement for the system
    -   Normative: A document that can be considered as mandatory to be followed.
    -   Books: A textual unit containing useful content
    -   Report: A unit reporting a study result
    -   Articles: An concept exploration or analysis
    -   Patterns: A reusable specification for the system.
    -   Checklist: A list of item that is expected to be checked
    -   Tool: A tool recommended for the system life-cycle.

## Contributing

Anyone can contribute, you can use VSCode to edit the document and send a 'request push' on Github to <https://github.com/alvaro-osvaldo-tm/Normative-Documents> , you collaboration will be appreciated.

New Obsidian configuration plugins will only be careful allowed to merge due security constraints.

## Roadmap

This repository is a work in progress , so still requires a more formal engineering structure to be applied, for future releases it's expected that this repository grows in maturity and include conceptual operations and automatic tools for validations.

### 0.0.1

Release basic build and documentation support.

-   [ ] Support documentation's build with Sphinx.
-   [ ] Build pipeline with Buildbot.
    -   [ ] Support Linter.
    -   [ ] Support Changelog file.
-   [ ] Support basic systems engineering practice.
-   [x] Basic support for Taxonomy
    -   [x] Taxonomy structure
    -   [ ] Tools to enforce taxonomy
-   [ ] Fix document's links.

### 0.2.0

Support collaborative and better editing

-   [ ] Minimal [WikiJS](Tools/Management/Knowledge%20Management/Information%20Capture/WikiJS.md) support.

### 0.3.0

Release requirements engineering

-   [ ] Support systems engineering practice.
    -   [ ] Support Requirements gathering practice
-   [ ] Better support for viewpoints.

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

#### System documents

Define a set of documents and deliverables to be released for the [stakeholders](Roles/Project/Stakeholders/Project%20Stakeholder%20Role.md) and [engineering team](Roles/Engineering/Engineering%20Role.md) for [Project Management](Taxonomy/Management/Project%20Management/Project%20Management.md).

-   Result Demonstration
    -   [ ] Define the [Changelog](Taxonomy/Engineering/Software%20Engineering/Software%20Release/Changelog.md) as a result document deliverable.
-   Quality Demonstration
    -   [ ] Define how to mesure

#### Data science support

Support data science and business intelligence projects.

-   Scope definition
    -   Structural Analysis
    -   Taxonomy and Thesaurus
-   Checklists
    -   Which question the dashboard need to answer ?
    -   Which will be the read-only fields?
    -   Which will data input fields?
    -   Which domains the fields will be ?
-   Guidelines
    -   Design
        -   Presentation
            -   Center the main decision indicators
            -   Fill alerts in red
            -   Define the presentation design standard
