# Git Version Control

This document normalizes the use of git as a version control system for textual files. It's possible to use these same normalisation defined there for no-textual files, but it's not recommended.

The only accepted software for this purpose it's [Git](../../../../../Externals/Engineering/Software%20Engineering/Version%20Control%20System/Git.md)] software and MUST BE configured according this document otherwise specified by the project.

The configurations described here , is for the system repository only. A configuration MUST NOT be enforce per-user global configuration to not conflict with user own needs.

## Realizes 

### Functions

- [Store changes in the system source](../../../../../Functions/Engineering/Software%20Engineering/Software%20Mangement/Version%20Control/Store%20changes%20in%20the%20system%20source.md)

## Solution

The solution consist in the [Git](../../../../../Externals/Engineering/Software%20Engineering/Version%20Control%20System/Git.md) software usage applying the following configurations described below

## Configurations in the repository

Configurations to be made in the [System Source Repository](../../../../../Taxonomy/Engineering/Software%20Engineering/Software%20Management/Version%20Control/System%20Source%20Repository.md).

### Branch configuration

To be applied in the repository branch configuration.

-   The main repository branch mais branch MUST BE 'main'.

### Gitattribute file

To be applied 

Some configurations MUST BE

<https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings>

[^git]: [Git. https://git-scm.com/](https://git-scm.com/)
[^attribute]: [Configurations for .gitattribute](#gitattribute)


### Configurations for user

These are mandatory To be applied using `git config` , it's MUST NOT be enforced to be applied as global user configuration to not conflic with user own needs.

| Key           | Value | Purpose                                                                               |
| :------------ | :---- | :------------------------------------------------------------------------------------ |
| core.autocrlf | false | Ensure the CRLF endline character don't be automatically managed by git. [^attribute] |

## Configurations for server

To be applied using `git config` on the repository server .

| Key                 | Value | Purpose                                                                |
|:------------------- |:----- |:---------------------------------------------------------------------- |
| receive.fsckObjects | true  | Verifies the connectivity and validity of the objects in the database. | 

## Committing 

The commits message will be used to generate [changelog](../../../../../Taxonomy/Engineering/Software%20Engineering/Software%20Release/Changelog.md), therefore MUST follow the [ChangeLog](../../Software%20Release/ChangeLog.md) guideline.



## Controls

## Demonstration

## Analysis

### Solution Limitations

-   Although git can be used to control textual documents like specifications and documents , it SHOULD NOT be considered a [Document Management System](../../../../../Taxonomy/Management/Document%20Management/Document%20Management%20System.md) due the lack of support for specialised cataloguing and retrieval functions.

## Constraints 

### Risks 

## Assumptions

## Requirements

## References

## Appendix 

### Unexplored Opportunities 


### Assessment

## Annex 


## Git Limitations
