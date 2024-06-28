# Environment Definition

This normative normalize the concept of at-least two images for the same code base, one only for production and other only for development.

## Additional Information

This normative structure is based in 12-factor app [^1][^2].

## Code Base

- An image MUST CONTAINS at least two usable version for same code base: 
	- These version MUST BE:
		- A "production" for production usage
		- A "development" for specific development usage , like file monitoring tools to restart services when code is edited.
	- In both case a [configuration](#Config) [^APP_ENV] MUST BE defined to allow the container to identify their state.

## Dependencies

## Config

- An image MUST CONTAINS an environment variable called 'APP_ENV' [^APP_ENV] that MUST be one of these values:
	- production: To indicate the container MUST run for production.
	- development: To indicate the container MUST run for development.

## Backing Services

## Build, Release, Run

## Processes

## Port Binding

## Concurrency

## Disposability

## Dev/Prod Parity

## Logs

## Admin Processes


[^1]: The Twelve-Factor App. https://12factor.net/
[^2]: An illustrated guide to 12 Factor Apps. https://www.redhat.com/architect/12-factor-app
[^APP_ENV]: These configuration was learned from Laravel. https://laravel.com/docs/master/configuration