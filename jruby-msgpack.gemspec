# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Andy Lindeman"]
  gem.email         = ["alindeman@gmail.com"]
  gem.description   = %q{MessagePack for JRuby using the native Java library}
  gem.summary       = %q{MessagePack for JRuby using the native Java library}
  gem.homepage      = "https://github.com/alindeman/jruby-msgpack"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "jruby-msgpack"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"

  gem.add_development_dependency "rspec", ">=2.8.0"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "jruby-openssl"
end
