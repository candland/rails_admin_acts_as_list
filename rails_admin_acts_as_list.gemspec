require_relative "lib/rails_admin_acts_as_list/version"

Gem::Specification.new do |spec|
  spec.name        = "rails_admin_acts_as_list"
  spec.version     = RailsAdminActsAsList::VERSION
  spec.authors     = ["Dusty Candland"]
  spec.email       = ["candland@gmail.com"]
  spec.homepage    = "https://candland.net"
  spec.summary     = "Add actions for models that use acts_as_list"
  spec.description = "Rails Admin plugin for the acts_as_list gem"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/candland/rails_admin_acts_as_list"
  spec.metadata["changelog_uri"] = "https://github.com/candland/rails_admin_acts_as_list"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.0"
end
