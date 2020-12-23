#!/usr/bin/env fish

function clean
    command rm -rfv $argv
end

set --global root (realpath (dirname (status filename))/../..)
and test -n "$root"; or exit

clean $root/dist
clean $root/out
