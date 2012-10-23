# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stress_reporter/version'

Gem::Specification.new do |gem|
  gem.name          = "stress_reporter"
  gem.version       = StressReporter::VERSION
  gem.authors       = ["Marcello Colacino", "Luca S.G. de Marinis"]
  gem.email         = ["marcello.colacino@interact.it", "loop23@gmail.com"]
  gem.description   = %q{Daemon that runs and reports on stressful stuff}
  gem.summary       = %q{Was born with specific needs but may be extended to cover more scenarios}
  gem.homepage      = "https://github.com/InteractSpa/stress_reporter"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'sys-cpu'
#  gem.add_runtime_dependency 'passenger'
  gem.add_runtime_dependency 'SystemTimer'

  gem.add_development_dependency 'rake'

end
