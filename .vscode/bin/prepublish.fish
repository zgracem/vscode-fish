#!/usr/bin/env fish

set --global root (realpath (dirname (status filename))/../..)

npm run compile; or exit
$root/.vscode/bin/yaml2json.fish; or exit
