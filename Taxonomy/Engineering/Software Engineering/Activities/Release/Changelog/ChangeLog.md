# ChangeLog

ChangeLog is a document that describe changes in a software system, the change log practice MUST start defining a well-organized and understandable architecture, even it's only a preliminary definition.

These organisation is a entry point for the commit messages in the in [Git](../../../../Externals/Engineering/Software%20Engineering/Version%20Control%20System/Git.md), that will be deployed with the artefact and persisted into a file named "CHANGELOG".

## Rationale

The changelog it's a tool to present results for the [stakeholder](../../../../Roles/Project/Stakeholders/Project%20Stakeholder%20Role.md) and for the [engineering team](../../../../Roles/Engineering/Engineering%20Role.md)

Therefore it's a critical document for results demonstration. However, due the large number of changes that can be made in a software the document release must be automated, for than an standardised operation must be made.

## Architectural Definition

The architecture MUST BE defined before starting the commit messages, even there is only a preliminar architecture definition , it's better than have nothing.

A basic architectural definitions to be included is defined below:

- sys: System repository
- req: System requirement
- spec: Other system specification

## Commit Messages

The commit messages are the starting point for the changelog , therefore it MUST follow the guidelines defined in [conventional commit guideline](../../../../Externals/Engineering/Software%20Engineering/Software%20Release/Changelog/Conventional%20Commit.md), following the changes specified below:

- The `scope` field MUST BE mandatory and related to the architecture component change.
- The `<type>[optional scope]: <description>` schema MUST HAVE a spaces when describing the scope to make more easily the reading. Therefore the schema change to:
 	- `<type> [optional scope]: <description>` when no breaking change is specified.
 	- `<type> [optional scope]! : <description>` when breaking change is specified.

To ensure these standard be full fill by the [developer](../../../../Roles/Engineering/Systems%20Engineering/System%20Developer%20Role.md) , it need to be enforced when applying the message.
