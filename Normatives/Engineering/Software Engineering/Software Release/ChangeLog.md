# ChangeLog


The change log practice MUST start defining a well-organized and understandable architecture, even it's only a preliminary definition.

These organisation is a entry point for the commit messages in the in [Git](../../../../Externals/Engineering/Software%20Engineering/Version%20Control%20System/Git.md), that will be deployed with the artefact and persisted into a file named "CHANGELOG".

## Architectural Definition

The architecture MUST BE defined before starting the commit messages, even there is only a preliminar architecture definition , it's better than have nothing.

A basic architectural definitions to be included is defined below:

- sys: System repository
- req: System requirement
- spec: Other system specification


## Commit Messages

The commit messages are the starting point for the changelog , therefore it MUST follow the guidelines defined in [conventional commit guideline](../../../../Externals/Engineering/Software%20Engineering/Software%20Release/Commiting/Conventional%20Commit.md), following the changes specified below

- The `scope` field MUST BE mandatory and related to the architecture component change.
