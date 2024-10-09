# Full Stack Home Lab

This is an enterprise architecture practice aimed to develop a lean architecture to support information strategy and processing, it also can be used as [platform engineering](https://en.wikipedia.org/wiki/Platform_engineering) base or building a business intelligence home lab.

It's not replace or more robust platform as [Kuberflow](https://www.kubeflow.org/) or public-cloud services, but serves as a quick and low-cost starter platform.

The architecture is follows the [TOGAF 10 Framework](https://pubs.opengroup.org/togaf-standard/) and the [ADM Method](https://pubs.opengroup.org/togaf-standard/adm/chap01.html), following a business-driven approach.

## Audience

This architecture is made for information systems professionals with focus in business and some engineering practices knowledge.

## Purpose

This architecture is a enterprise architecture , not a software architecture, the purpose is to meet business needs and their motivations.

The scope is limited to business intelligence and data science programs and uses as foundation concepts from data-driven, cloud native, systems engineering, model-based engineering and lean engineering practices.

It's allow an information systems professional to quickly apply information processing and govern data under their programs.

The technology foundation is mainly focused for a home lab to execute low cost programs or being integrated into cloud or externals infrastructures.

Integrations with other architectures or organisations allow interchange data and process into a secure and comprehensive manner without distributing other's architectures.

## Requirements

Handle this architecture will require a set of knowledge than cloud or computational skills, this architecture aims business needs and their motivations, so a broader requirements is specified in this section.

As it's a work in progress , currently no diferences was made for users or developers requirements.

**Business Requirements**

This architecture is made with TOGAF 10 and the ADM Method , this is not mandatory if you only will work with computation resources, but is need to make architectural changes or integrations.

The architecture is also described in Archimate using mainly the tool [Enterprise Architect](https://sparxsystems.com/) , not available as a free tool into a [PostgreSQL RDBMS](https://www.postgresql.org/).

Other business concepts important for understanding is the [Zachman Framework](https://zachman-feac.com/zachman/about-the-zachman-framework) , useful for integrations.

**Engineering Requirements**

The architecture follow Lean Engineering practices with systems engineering and Model-Based Engineering, it's useful to understand these concept because the architectural decisions made follow these practices.

**Computational resources**

For a home lab program , the architecture requires a minimum 1 computer from 8 to 64 GB RAM, more computers or processing units can be attach as need or a cloud provider be integrated to use both computational resources and services.

The mainly operation system is Debian always in their stable flavor, other operation systems is allowed but not supported to reduce the architecture cost.

The processing software orchestration is made mainly with [Docker](https://www.docker.com/) in [Swarm mode](https://docs.docker.com/engine/swarm/), but further releases will be made using [Kubernetes](https://kubernetes.io/) to reduce friction with cloud providers and ensure more mature infrastructure and services.

## Usage

There is no current usage version , but the computational resources will be made available using scripts.

## Limitations

This architecture is a work in progress the current implementation uses mainly Docker in Swarm mode to orchestrate information services but the further releases will evolve to Kubernets.

Security is a concern and risk management layer is under architecture implementation but still not mature.

Interoperability with open-source tool as [Archi](https://www.archimatetool.com/) to allow collaboration without spending into Enterprise Architect tool is under study.

## Contributing

Anyone can contribute, you can use VSCode to edit the document and send a 'request push' on Github to <https://github.com/alvaro-osvaldo-tm/Normative-Documents> , you collaboration will be appreciated.

## Roadmap

This repository is a work in progress , so still requires a more formal engineering structure to be applied, for future releases it's expected that this repository grows in maturity and include conceptual operations and automatic tools for validations.

### 0.0.1

Release basic build and documentation support.

-   [ ] Provide Basic Foundation Architecture
-   [ ] Provide Architecture Governance Support
-   [ ] Support Basic Requirements Management
-   [ ] Support documentation's build with Sphinx.
-   [ ] Build pipeline for GitTea.
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
    -   Which will be read-only fields?
    -   Which will data input fields?
    -   Which domains the fields will be ?
-   Guidelines
    -   Design
        -   Presentation
            -   Center the main decision indicators
            -   Fill alerts in red
            -   Define the presentation design standard
