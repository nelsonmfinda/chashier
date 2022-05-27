# frozen_string_literal: true

require_relative "lib/cashier/version"

Gem::Specification.new do |spec|
  spec.name          = "cashier"
  spec.version       = Cashier::VERSION
  spec.authors       = ["Nelson Mfinda"]
  spec.email         = ["hi@nelsonmfinda.dev"]

  spec.summary       = "A simple cashier function."
  spec.description   = "A simple cashier function that adds products to a cart and displays the total price."
  spec.homepage      = "https://github.com/nelsonmfinda/chashier"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nelsonmfinda/chashier"
  spec.metadata["changelog_uri"] = "https://github.com/nelsonmfinda/chashier/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "bigdecimal", '~> 3.1', '>= 3.1.2'
  spec.add_dependency "fuubar", '~> 2.5', '>= 2.5.1'
  spec.add_dependency "rubocop-performance", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
