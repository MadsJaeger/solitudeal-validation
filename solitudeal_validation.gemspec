require_relative 'lib/solitudeal_validation/version'

Gem::Specification.new do |spec|
  spec.name        = 'solitudeal_validation'
  spec.version     = SolitudealValidation::VERSION
  spec.authors     = ['MadsJaeger']
  spec.email       = ['madshjaeger@gmail.com']
  spec.homepage    = 'https://github.com/madsjaeger/solitudeal-validation'
  spec.summary     = 'A Rails plugin for placing validations in solitude.'
  spec.description = 'This gem works on top of rails validations by providing
    a convention for placing validational logic into a sibling class of the model.
    This may improve code readablity and provide better leverage for the single
    responsibility dogma.'
  spec.license     = 'MIT'
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = ''

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 7.0.4'
  spec.add_development_dependency 'rspec', '~> 3.11'
  spec.add_development_dependency 'rspec-rails', '~> 6.0.0.rc1'
  spec.add_development_dependency 'pry'
end
