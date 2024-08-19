# Execute a task at each commit

When using a [Husky](../../Tools/Git%20Version%20Control/Commits/Husky.md), configure the script '.husky/pre-commit' following the sample below:

```bash

# .husky/pre-commit
prettier $(git diff --cached --name-only --diff-filter=ACMR | sed 's| |\\ |g') --write --ignore-unknown
git update-index --again
```

It's important to use `git update-index --again` if the files was been modified.
