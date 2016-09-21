# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'job_sorter/version'

Gem::Specification.new do |spec|
  spec.name          = "job_sorter"
  spec.version       = JobSorter::VERSION
  spec.authors       = ["Alexandra Wolfe"]
  spec.email         = ["rubyandcoffee@gmail.com"]

  spec.summary       = %q{Sorts jobs into required order using TSort.}
  spec.description   = %q{Given a list of jobs and their dependencies, this gem sorts jobs into required order using TSort.}
  spec.homepage      = "http://github.com/rubyandcoffee/job_sorter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
