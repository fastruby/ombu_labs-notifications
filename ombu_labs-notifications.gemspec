require_relative "lib/ombu_labs/notifications/version"

Gem::Specification.new do |spec|
  spec.name        = "ombu_labs-notifications"
  spec.version     = OmbuLabs::Notifications::VERSION
  spec.authors     = ["Fiona"]
  spec.email       = ["fiona@ombulabs.com"]
  spec.homepage    = "https://github.com/fastruby/ombu_labs-notifications"
  spec.summary     = "A gem to send notifications via email, Slack"
  spec.description = "Knows how to send a new contact email, new contact Slack notification"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://fastruby/ombulabs/ombu_labs-notifications"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/fastruby/ombu_labs-notifications"
  spec.metadata["changelog_uri"] = "https://github.com/fastruby/ombu_labs-notifications"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0"
  spec.add_dependency "slack-notifier", ">= 2.4.0"
  spec.add_dependency "sidekiq", ">= 5.0"
end
