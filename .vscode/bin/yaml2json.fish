#!/usr/bin/env fish

function remove_regex_comments
    sed -E '/^[[:space:]]+\(\?#/d' $argv[1]
end

function interpolate_variables -a template_file
    set -l pwd (dirname (status filename))
    $pwd/ntrpl8r.rb $template_file
end

function yaml2json
    set -l src
    set -l libs yaml json

    if set -q argv[1]
        set -a libs pathname
        set src "Pathname.new(ARGV[0])"
    else if not isatty stdin
        set src ARGF
    else
        echo >&2 "nothing to convert!"
        return 1
    end

    ruby -r$libs -e "puts YAML.load($src.read).to_json" $argv[1]
end

function remove_json_comments
    set -l pwd (dirname (status filename))
    jq -f $pwd/remove_comments.jq
end

function inject_uuid
    set -l uuid "73fe8880-b0d7-4073-8543-e923d65dad79"
    jq '.uuid="'$uuid'"'
end

function inject_schema
    set -l url "https://raw.githubusercontent.com/martinring/tmlanguage/master/tmlanguage.json"
    jq '{"$schema":"'$url'"} + .'
end

function format_json
    jq '.'
end

# interpolate_variables syntaxes/fish.tmLanguage.yaml.in \
#     >syntaxes/fish.tmLanguage.yaml

remove_regex_comments syntaxes/fish.tmLanguage.yaml | yaml2json \
    | format_json \
    >syntaxes/fish.tmLanguage.json

yaml2json syntaxes/fish-markdown-codeblock.tmLanguage.yaml \
    | inject_schema \
    >syntaxes/fish-markdown-codeblock.tmLanguage.json

yaml2json syntaxes/fish_variables.tmLanguage.yaml \
    | inject_schema \
    >syntaxes/fish_variables.tmLanguage.json
