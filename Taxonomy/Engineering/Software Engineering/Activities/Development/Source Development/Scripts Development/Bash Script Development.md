# Bash Script Development

This normative defines how a `Bash` script MUST BE developed.

## Code Base

## Dependencies

- The runtime environment MUST BE configured to stop when an error occur.
  - This can be done with the script first-line as `#/bin/bash -e`

## Security

- The development MUST BE made into a container in isolation from the overall user environment.
  - This is because the script can manipulate files including their removal, and a bug during the development can damage the user's environment.
