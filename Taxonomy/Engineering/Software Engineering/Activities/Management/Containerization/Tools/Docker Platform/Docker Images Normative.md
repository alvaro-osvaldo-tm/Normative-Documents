# Docker Images Normative

This normative define how a Docker Image MUST BE or SHOULD BE build and made available.

## Additional Information

This normative structure is based in 12-factor app [^1][^2], the section `Build, Release, Run` was renamed to `Build, Release, Run, Debug`, to include debug concept.

## Code Base

## Dependencies

## Config

-   For the same code base always MUST BE at least two configurations modes for the same code base define in the environment variable 'APP_ENV' [^app_env]
    -   These variable MUST support these two values:
        -   production: To indicate the container MUST run for production.
        -   development: To indicate the container MUST run for development.
    -   Other values for the 'APP_ENV' MUST BE avoided.

## Backing Services

## Build, Release, Run, Debug

### Building

-   Metadata
    -   The 'LABEL' instruction in '`Dockerfile`' MUST follow the '[Open Container Specification](../../../../../External/Engineering/Software%20Engineering/Containerization/Specifications/Open%20Container%20Specification.md)' with at least these annotations:
        -   `org.opencontainers.image.authors`
        -   `org.opencontainers.image.ref.name`
        -   `org.opencontainers.image.licenses`
        -   `org.opencontainers.image.title`
        -   `org.opencontainers.image.description`
    -   The '`index.json`' image descriptor as defined in the '[Open Container Specification](../../../../../External/Engineering/Software%20Engineering/Containerization/Specifications/Open%20Container%20Specification.md)' IS NOT required due the facility to be created with 'docker inspect' command.
    -   When a 'target' is defined in the instruction 'FROM' , at last the annotations below MUST BE defined in the same target to reflect their purpose:
        -   `org.opencontainers.image.ref.name`
        -   `org.opencontainers.image.description`
-   Dockerfile
    -   When configuring the instructions for a image build, the configuration MUST BE [Open Container Specification](../../../../../External/Engineering/Software%20Engineering/Containerization/Specifications/Open%20Container%20Specification.md) compatible [^ImageSpec].
    -   There MUST BE defined a 'HEALTHCHECK' instruction.
        -   If there is no HEALTHCHECK need , then `HEALTHCHECK NONE` MUST BE defined.
    -   There MUST BE only 1 '`Dockerfile`' for common codebase release.
        -   The parameters 'platform' and 'target' in '`FROM`' [^FROM] instruction MUST BE used if need to be released many variants for the same codebase as is expected for '[Administration](#administration)'.
    -   Dependencies configuration files like '`requirements.txt`' or '`package.json`' MUST BE copied and installed early as possible to take advantage of layer caching in Docker.
-   .dockerignore
    -   A '`.dockerignore`' file MUST exists even it's left blank.

### Releasing

### Running

### Debugging

## Processes

## Port Binding

## Concurrency

## Disposability

## Dev/Prod Parity

## Logs

## Administration

[^1]: The Twelve-Factor App. <https://12factor.net/>
[^2]: An illustrated guide to 12 Factor Apps. <https://www.redhat.com/architect/12-factor-app>
[^APP_ENV]: These configuration was learned from Laravel. <https://laravel.com/docs/master/configuration>
[^FROM]: Dockerfile reference. <https://docs.docker.com/reference/dockerfile/#from>
[^ImageSpec]: The OpenContainers Image Spec Config. <https://specs.opencontainers.org/image-spec/config/?v=v1.0.1>
