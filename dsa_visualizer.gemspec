Gem::Specification.new do |spec|
  spec.name          = "dsa_visualizer"
  spec.version       = "0.1.0"
  spec.authors       = ["DSA Learning Team"]
  spec.email         = ["team@example.com"]

  spec.summary       = "Learn DSA from Zero to Hero with Ruby and C++ comparisons"
  spec.description   = "A comprehensive gem for learning Data Structures and Algorithms from scratch by visualizing concepts at the core level, comparing Ruby and C++ implementations with step-by-step execution details, detailed notes, practice problems, and progress tracking. Covers 12 sections from fundamentals to advanced topics with 50+ concepts."
  spec.homepage      = "https://github.com/yourusername/dsa_visualizer"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.files         = Dir["lib/**/*", "bin/*", "README.md", "USAGE.md", "LICENSE.txt"]
  spec.bindir        = "bin"
  spec.executables   = ["dsa_visualizer"]
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize", "~> 1.1"
  spec.add_dependency "tty-box", "~> 0.7"
  spec.add_dependency "tty-table", "~> 0.12"
  
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rake", "~> 13.0"
  
  spec.metadata = {
    "bug_tracker_uri"   => "https://github.com/yourusername/dsa_visualizer/issues",
    "changelog_uri"     => "https://github.com/yourusername/dsa_visualizer/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://github.com/yourusername/dsa_visualizer/blob/main/README.md",
    "source_code_uri"   => "https://github.com/yourusername/dsa_visualizer"
  }
end
