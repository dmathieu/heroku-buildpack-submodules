require 'parseconfig'

config = ParseConfig.new("#{ENV['BUILD_DIR']}/.gitmodules")

config.get_params.each do |param|
  next unless param.match(/^submodule/)
  c = config[param]
  
  branch = c["branch"]
  
  if branch == nil
    branch = "master"
  end

  puts "---> Installing submodule #{c["path"]}"
  `git clone #{c["url"]} -b #{branch} #{ENV['BUILD_DIR']}/#{c["path"]}`

  puts "----> Removing submodule git folder"
  `rm -rf #{ENV['BUILD_DIR']}/#{c["path"]}/.git`
end
