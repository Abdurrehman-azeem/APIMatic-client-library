# pet_store_client.gemspec
Gem::Specification.new do |spec|
  spec.name          = "pet_store_client"
  spec.version       = "1.0.0"
  spec.authors       = ["Abdurrehman"]
  spec.email         = ["abdurrehman.azeem81@hotmail.com"]

  spec.summary       = "Rubyclient for the Pet Store API"
  spec.description   = "Provides methods to create, update, and manage pets and orders."
  spec.homepage      = "https://github.com/Abdurrehman-azeem"
  spec.license       = "MIT"

  spec.required_ruby_version = "3.4.7"

  # Specify which files should be included
  spec.files         = Dir["lib/**/*", "README.md"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependencies (if any)
  # spec.add_dependency "httparty", "~> 0.20"
  # spec.add_development_dependency "rspec"
end
