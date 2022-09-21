require_relative "lib/solitudeal_validation/version"

Gem::Specification.new do |spec|
  spec.name        = "solitudeal_validation"
  spec.version     = SolitudealValidation::VERSION
  spec.authors     = ["MadsJaeger"]
  spec.email       = ["madshjaeger@gmail.com"]
  spec.homepage    = "https://github.com/madsjaeger/solitudeal-validation"
  spec.summary     = "Summary of SolitudealValidation."
  # spec.description = "TODO: Description of SolitudealValidation."
    spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.4"
  spec.add_development_dependency "rspec", '~> 3.11'
  spec.add_development_dependency "rspec-rails", '~> 6.0.0.rc1'
  spec.add_development_dependency "pry"
end
