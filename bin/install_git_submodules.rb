require 'rubygems'
Gem.clear_paths

require 'parseconfig'
require_relative 'utils'

config = ParseConfig.new("#{ENV['BUILD_DIR']}/.gitmodules")

config.get_params.each do |param|
  next unless param.match(/^submodule/)
  c = config[param]

  Utils.with_stdlib "puts_step \"Installing submodule #{c["path"]}\""
  branch_flag = c["branch"] ? "-b #{c['branch']}" : ""
  `git clone #{c["url"]} #{branch_flag} #{ENV['BUILD_DIR']}/#{c["path"]}`

  Utils.with_stdlib "puts_step \"Removing submodule git folder\""
  `rm -rf #{ENV['BUILD_DIR']}/#{c["path"]}/.git`
end
