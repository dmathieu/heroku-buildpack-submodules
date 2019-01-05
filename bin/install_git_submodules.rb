require 'rubygems'
Gem.clear_paths

require 'parseconfig'

config = ParseConfig.new("#{ENV['BUILD_DIR']}/.gitmodules")

config.get_params.each do |param|
  next unless param.match(/^submodule/)
  c = config[param]

  puts "-----> Installing submodule #{c["path"]} #{c["branch"]}"
  branch_flag = c["branch"] ? "-b #{c['branch']}" : ""
  `git clone --single-branch #{c["url"]} #{branch_flag} #{ENV['BUILD_DIR']}/#{c["path"]}`
  if c.key?("revision")
    puts "       Setting submodule revision to #{c["revision"]}"
    Dir.chdir(c["path"]) do
      `git reset --hard #{c["revision"]}`
    end
  end

  puts "       Removing submodule git folder"
  `rm -rf #{ENV['BUILD_DIR']}/#{c["path"]}/.git`
end
