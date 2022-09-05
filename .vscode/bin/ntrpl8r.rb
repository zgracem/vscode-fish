#!/usr/bin/env ruby
# frozen_string_literal: true

require "pathname"
require "yaml"

data_file = "#{__dir__}/../etc/variables.yaml"
template_file = ARGV[0] || "#{__dir__}/../../syntaxes/fish.tmLanguage.yaml.in"
modeline = "# vim:ft=yaml\n"

def braces_to_printf(string)
  string.gsub(/%/, "\\\\0").gsub(/\{\{(\w+)\}\}/, "%<\\1>s")
end

template = Pathname(template_file).read.sub(modeline, "")
variables = YAML.load(Pathname(data_file).read)
                .fetch("variables")
                .transform_keys(&:to_sym)
                .transform_values { |val| braces_to_printf(val) }

interpolated_variables = variables.transform_values do |val|
  format(format(format(val, variables), variables), variables)
end

puts format(braces_to_printf(template), interpolated_variables).gsub(/\\0/, "%")
