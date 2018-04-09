require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rake/extensiontask"

RSpec::Core::RakeTask.new(:spec)

task :default => [:compile, :spec]

Rake::ExtensionTask.new "fast_activesupport" do |ext|
  ext.lib_dir = "lib/fast_activesupport"
end

Rake::ExtensionTask.new "fast_activesupport/security_utils" do |ext|
  ext.lib_dir = "lib/fast_activesupport"
end
