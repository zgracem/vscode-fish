#!/usr/bin/env fish

function package_metadata
    jq -r "$argv" $root/package.json
end

set --global root (realpath (dirname (status filename))/../..)
set slug (package_metadata '"\(.publisher).\(.name)-\(.version)"')

mkdir -p $root/dist
vsce package --no-yarn --out $root/dist/$slug.vsix
