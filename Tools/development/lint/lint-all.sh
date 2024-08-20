#!/bin/sh

#
# Lint or do static code check on all source code
#

cd "$(dirname "$0")/../../.." || exit 1


# Lint with prettier
npx prettier --log-level warn --write .


# Lint all shell files
find . -type f -name '*.sh' ! -wholename '*/.npm/*' ! -wholename "*/node_modules/*" ! -wholename "./.husky/*" -exec npx shellcheck '{}' \;

# Lint all husky git hooks
 find .husky -type f  -maxdepth 1 -exec npx shellcheck -e SC1081 '{}' \;