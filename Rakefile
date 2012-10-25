require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test

require 'yard'
require 'yard/rake/yardoc_task'

project_root = File.expand_path(File.dirname(__FILE__))
doc_destination = File.join(project_root, 'doc')

YARD::Rake::YardocTask.new(:generate) do |yt|
  yt.files   = Dir.glob(File.join(project_root, 'lib', '**', '*.rb')) +
    [ File.join(project_root, 'README.md') ]
  yt.options = ['--output-dir', doc_destination, '--readme', 'README.md']
end

# Rake::RDocTask.new(:rdoc) do |rdoc|
#   rdoc.rdoc_dir = 'doc'
#   rdoc.main = 'README.md'
# #  rdoc.rdoc_files.include 'README.md', 'CHANGELOG.txt', "config/**/*\.rb", "helpers/**/*\.rb", "script/**/*\.rb"
#   rdoc.rdoc_files.include 'README.md', "lib/**/*\.rb"
#   rdoc.options << '--line-numbers'
#   rdoc.options << '--all'
# end
