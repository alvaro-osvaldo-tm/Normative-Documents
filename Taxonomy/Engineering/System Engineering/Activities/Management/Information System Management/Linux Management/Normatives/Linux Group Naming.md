# Linux Group Naming


To define a group name into a Linux system for long-term management , it's recommended the following schema.

## Schema

These schema conforms the [IEEE Std 1003.1-2001](https://standards.ieee.org/ieee/1003.1/1389/) , due their restriction on 32 characters their fields values are abbreviated into 3 length characters separated by an 'hyphen' (-) each field. Except for the 'Artefact Namespace' that can vary from 1 to 20 characters.

The limit for the 3 length, can seems small , but it's allow 33696 characters combinations following the regular expression "`^\[a-z]([a-z]|[0-9])([a-z]|[0-9])$`", note the first character MUST BE a sequence from a-z , not allowed a number to the group name not conflict with the IEEE standard,the 2 last characters can be numbers.

All characters in the group name MUST BE at lowercase to avoid human error and Debian Policy conflicts  ( `adduser` command in Debian).

The fields separated by hyphen are the following below:

-  **Organisation**: means at the artefact group belongs or ownership, since it's possible the business organisation can add or remove subsidiary or the Linux system handle many organisations at once.

- **Artefact Class**: means a groupment for the artefact nameclass,  vary from 'program', 'documentation', it's is defined in by the [Information System Manager](../../../../../Roles/Management/System%20Management/Information%20System%20Management/Information%20System%20Manager.md), it as form to informa overall characteristics of function of the artefact.
- **Artefact Nameclass**: means the artefact naming boundary , like a project name or a company department. It was allowed to use more characters than other fields due the need to reflect a better meaning for human purposes.
- **Permission Class**: means the rights over the artefact that the users in the named group will be granted, it's not imposes permissions but serves as an information to be used when the permission is configured ( like when using `chmod` or `setfacl` ). A more detailed explanation is detailed in [Permissions](#Permissions)


**Schema:** 

*Organisation*-*Artefact Group*-*Artefact Namespace*-*Permission Class*

**Fields Length:**

| Field              | Min Length | Max Length | Example      | Example Meaning   |
|:------------------ |:----------:|:----------:| ------------ | ----------------- |
| Organisation       |     3      |     3      | acm          | ACME Organisation |
| Artefact Class     |     3      |     3      | prj          | Projects          |
| Artefact Namespace |     1      |     20     | sales_for_t2 | Sales for T2      |
| Permission Class   |     3      |     3      | r            | For reading only  | 

Max characters: 32.


## Permissions

The "*Permission Class*" field objective it's to inform to an [Information System Manager](../../../../../Roles/Management/System%20Management/Information%20System%20Management/Information%20System%20Manager.md) the permissions limitations expected to be configured for the group name when using `chmod`, `setfacl` or other management software.

Due the Linux's architecture , these configuration need to consider if it will be applied to a directory or a file , the tables bellow shows the `chmod` or `setfacl` parameters considered for each class.



| Value | Case       | Meaning                                    | List | Create | Edit       | On Directory | On File |
|:----- | ---------- |:------------------------------------------ |:----:|:------:| ---------- | ------------ | ------- |
| a     | All        | Can list directory, create and edit files  | Yes  |  Yes   | Yes        | rwx          | rw      |
| s     | Save       | Can list directory, create and read files  | Yes  |  Yes   | Read-Only  | rwx          | r       |
| w     | Writer     | Can list directory, create and write files | Yes  |  Yes   | Write-Only | rwx          | w       |
| c     | Archive    | Can create and edit on files               |  No  |  Yes   | Yes        | wx           | rw      |
| e     | Restore    | Can create and read on files               |  No  |  Yes   | Read-Only  | wx           | r       |
| b     | Backup     | Can create and write on files              |  No  |  Yes   | Write-Only | wx           | w       |
| m     | Manipulate | Can list and edit files                    | Yes  |   No   | Yes        | rx           | rw      |
| r     | Reader     | Can list and read on files                 | Yes  |   No   | Read-only  | rx           | r       |
| d     | Add        | Can list and write on files                | Yes  |   No   | Write-only | rx           | w       |
| p     | Patch      | Can edit on files                          |  No  |   No   | Yes        | x            | rw      |
| o     | Loader     | Can read on files                          |  No  |   No   | Read-only  | x            | r       |
| n     | Append     | Can write on files                         |  No  |   No   | Write-only | x            | w       |
| z     | None       | Can do nothing                             |  No  |   No   | No         | 0            | 0       | 



## Rationale

## Examples

| Group Name                    | Organisation      | Artefact Class | Artefact Namespace | Permission Class |
| ----------------------------- | ----------------- | -------------- | ------------------ | ---------------- |
| acm-prj-sales_for_t2-r        | ACME Organisation | Project        | Sales for T2       | Read Only        |
| acm-prj-sales_for_t2-a       | ACME Organisation | Project        | Sales for T2       | Read and Write   |
| acm-acc-important_accounts-a | ACME Organisation | Accountability | Important Accounts | Read Only        |
| ac2-dta-sales_history-r       | ACME Subsidiary 2 | Database       | Sales History      | Read Only        |

## Appendix

### Permissions effect  in directories


It's a table showing the effects when setting the a permission on a directory in Linux using the command `setfacl -m u::<permission> ./directory`. And the tested with the following commands in a directory with a file named `existing_file`:

```bash

# List files
$ ls ./directory


# Create Files
$ touch ./directory/new_file

# Read Files
$ cat ./directory/existing_file

# Write Files
$ echo "new content" >> ./directory/existing_file

```

The results if the command was successful was registered below.

| Permission | List Files | Create Files | Read Files | Write Files |
| ---------- |:----------:|:------------:|:----------:|:-----------:|
| r          |     -      |      -       |     -      |      -      |
| w          |     -      |      -       |     -      |      -      |
| x          |     -      |      -       |    Yes     |     Yes     |
| rw         |     -      |      -       |     -      |      -      | 
| rx         |    Yes     |      -       |    Yes     |     Yes     |
| wx         |     -      |     Yes      |    Yes     |     Yes     |
| rwx        |    Yes     |     Yes      |    Yes     |     Yes     |
