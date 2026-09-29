def add_custom_gemspec_data(spec)
  spec.name = "affinity-health-sdk"
  spec.authors = ["Affinity Health"]
  spec.license = "MIT"
  spec.homepage = "https://github.com/affinity-health/affinity-ruby"
  spec.files = Dir["lib/**/*.rb", "README.md", "LICENSE", "generation.json"]
end
