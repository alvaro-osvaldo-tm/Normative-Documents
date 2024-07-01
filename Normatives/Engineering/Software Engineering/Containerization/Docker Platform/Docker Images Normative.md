# Environment Definition

This normative normalize the concept of at-least two images for the same code base, one only for production and other only for development.

## Additional Information

This normative structure is based in 12-factor app [^1][^2].

## Code Base

## Dependencies

## Config

- For the same code base always MUST BE at least two configurations modes for the same code base define in the environment variable 'APP_ENV' [^app_env] 
	- These variable MUST support these two values: 
		- production: To indicate the container MUST run for production.
		- development: To indicate the container MUST run for development.
	- Other values for the 'APP_ENV' MUST BE avoided.

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