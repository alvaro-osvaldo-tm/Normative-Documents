# Version Control

This document normalizes the use of the version control system for textual files. It's possible to use these same normalisation defined there for no-textual files, but it's not recommended.

The only accepted software for this purpose it's git[^git] and MUST BE configured according this document otherwise specified by the project.

The configurations described are is for the current source repository that applies to this system. A configuration MUST NOT be enforce per-user to not conflict with user own needs.

## Git Limitations

-   Although git can be used to control textual documents like specifications and documents , it SHOULD NOT be considered a [Document Management System](../../../../Taxonomy/Management/Document%20Management/Document%20Management%20System.md) due the lack of support for specialised cataloguing and retrieval functions.

## Branch Configurations

-   The mais branch MUST BE 'main'.

## Git configurations for users

These are mandatory To be applied using `git config`

| Key           | Value | Purpose                                                                               |
| :------------ | :---- | :------------------------------------------------------------------------------------ |
| core.autocrlf | false | Ensure the CRLF endline character don't be automatically managed by git. [^attribute] |

## Git configurations for server

To be applied using `git config`

| Key                 | Value | Purpose |
| :------------------ | :---- | :------ |
| receive.fsckObjects | true  |         |

## Gitattribute

Some configurations MUST BE

<https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings>

[^git]: [Git. https://git-scm.com/](https://git-scm.com/)
[^attribute]: [Configurations for .gitattribute](#gitattribute)


## Committing 

The commits message will be used to generate [changelog](../../../../Taxonomy/Engineering/Software%20Engineering/Software%20Release/Changelog.md), therefore MUST follow the [ChangeLog](../Software%20Release/ChangeLog.md) guideline.