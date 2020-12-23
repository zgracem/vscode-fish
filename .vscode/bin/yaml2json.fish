#!/usr/bin/env fish

sed -E '/^[[:space:]]+\(\?#/d' _scratch/fish.YAML-tmLanguage \
| pyjamas -i yaml -o json \
| jq -f bin/_modify_json.jq \
| tee syntaxes/fish.tmLanguage.json
