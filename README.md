# Full Stack Home Lab

This is an enterprise architecture aimed to develop a lean architecture to support information strategy and processing under a value-driven perspective. It also can be used as [platform engineering](https://en.wikipedia.org/wiki/Platform_engineering) base or building a business intelligence home lab.

It's not replace or more robust platform as [Kuberflow](https://www.kubeflow.org/) or public-cloud services, but serves as a quick and low-cost starter platform.

The architecture is follows the [TOGAF 10 Framework](https://pubs.opengroup.org/togaf-standard/) and the [ADM Method](https://pubs.opengroup.org/togaf-standard/adm/chap01.html), following a value-driven and business-driven approach.

## Audience

This architecture is made for information systems professionals with focus in business under a value-driven perspective and some engineering practices knowledge.

## Purpose

This architecture is a enterprise architecture , not a software architecture, the purpose is to meet under a value-driven perspective the business needs and their motivations.

The scope is limited to business intelligence and data science programs using as foundation concepts from data-driven, cloud native, systems engineering, model-based engineering and lean engineering practices.

It's allow an information systems professional to quickly apply information processing and govern data under their programs while keep tracking the overall business value-stream.

The technology foundation is mainly focused for a home lab to execute low cost programs or being integrated into cloud or externals infrastructures.

Integrations with other architectures or organisations it's allow interchange data and process into a secure and comprehensive manner without distributing other's architectures and participate from a more larger value-stream.

## Requirements

Handle this architecture will require a set of knowledge than cloud or computational skills, this architecture aims to follow a value-driven perspective to meet business needs and their motivations, so a broader requirements in business knowledge is specified in this section.

As it's a work in progress , currently no diferences was made for users or developers requirements.

**Business Requirements**

This architecture is made focusing a value-driven paradigm with TOGAF 10 and the ADM Method , knowing these concepts this is not mandatory if you only will work with computation resources, but is need to make architectural changes or integrations, specially the [business capability](https://pubs.opengroup.org/togaf-standard/business-architecture/business-capabilities.html#_Toc95135878) and the [building blocks](https://pubs.opengroup.org/togaf-standard/architecture-content/chap05.html) concepts.

The architecture is also described in Archimate using mainly the tool [Enterprise Architect](https://sparxsystems.com/) into a [PostgreSQL RDBMS](https://www.postgresql.org/), not available as a free tool.

Other business concepts important for understanding is the [Zachman Framework](https://zachman-feac.com/zachman/about-the-zachman-framework) , useful for integrations.

**Engineering Requirements**

The main concepts need to know it's the life-cycle from systems engineering (or software engineering) and lean engineering practices , both because each architectural component is made under a life-cycle that governs the overall architecture and meet the desired business value.

Model-Based Engineering is also a concept useful to understand because much of the architecture automation is made following the concept of [infrastructure as code](https://en.wikipedia.org/wiki/Infrastructure_as_code) or model-based approach.

**Computational resources**

For a home lab program , the architecture requires a minimum 1 computer from 8 to 64 GB RAM, more computers or processing units can be attach as need or a cloud provider be integrated to use both computational resources and services.

The operation system is Debian, always in their last stable flavor, no Long-Term Support was choice to avoid being constrained due to lack of some newer features.

The architecture is x86-64 (Intel), AMD or other x86-64 is allowed but was not tested.

Other operation systems or architecture set as ARM is allowed but not supported to reduce the architecture cost.

The definition os "allowed but not tested" means is expected to work but is not know if will work.

The definition for "allowed but not supported" means the architecture do not explicitly imposes a restriction but is not expected to work.

The processing software orchestration is made mainly with [Docker](https://www.docker.com/) in [Swarm mode](https://docs.docker.com/engine/swarm/), but further releases will be made using [Kubernetes](https://kubernetes.io/) to reduce friction with cloud providers and ensure more mature infrastructure and services.

Docker over Windows or Docker Desktop is allowed but not supported.

## Usage

There is no current usage version , but the computational resources will be made available using scripts.

## Limitations

This architecture is a work in progress the current implementation uses mainly Docker in Swarm mode to orchestrate information services but the further releases will evolve to Kubernets.

Security is a concern and a architectural risk management layer is under implementation but still not mature.

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
