# frozen_string_literal: true

require_relative "lib/ombu_labs/notifications/version"

Gem::Specification.new do |spec|
  spec.name = "ombu_labs-notifications"
  spec.version = OmbuLabs::Notifications::VERSION
  spec.authors = ["Ernesto Tagwerker"]
  spec.email = ["ernesto+github@ombulabs.com"]

  spec.summary = "A gem to send notifications via email, Slack, and Hubspot."
  spec.description = "Knows how to send a new contact email, new contact Slack notification, and create a deal in Hubspot."
  spec.homepage = "https://github.com/ombulabs/ombu_labs-notifications"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ombulabs/ombu_labs-notifications"
  spec.metadata["changelog_uri"] = "https://github.com/ombulabs/ombu_labs-notifications/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["app", "lib"]

  spec.add_dependency "hubspot-api-client", ">= 13.2.0"
  spec.add_dependency "sidekiq", ">= 5.0"
  spec.add_dependency "slack-notifier", ">= 2.4.0"
end
