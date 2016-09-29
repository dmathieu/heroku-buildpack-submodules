require 'parseconfig'

config = ParseConfig.new("#{ENV['BUILD_DIR']}/.gitmodules")

config.get_params.each do |param|
  next unless param.match(/^submodule/)
  c = config[param]
  
  branch = c["branch"]

  puts "---> Installing submodule #{c["path"]}"
  if branch
    `git clone #{c["url"]} -b #{branch} #{ENV['BUILD_DIR']}/#{c["path"]}`
  else
    `git clone #{c["url"]} #{ENV['BUILD_DIR']}/#{c["path"]}`
  end
  
  puts "----> Removing submodule git folder"
  `rm -rf #{ENV['BUILD_DIR']}/#{c["path"]}/.git`
end
