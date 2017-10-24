# -*- encoding: utf-8 -*-
# stub: jekyll-compose 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-compose"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Parker Moore"]
  s.date = "2016-10-11"
  s.description = "Streamline your writing in Jekyll with these commands."
  s.email = ["parkrmoore@gmail.com"]
  s.homepage = "https://github.com/jekyll/jekyll-compose"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Streamline your writing in Jekyll with these commands."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>, [">= 3.0.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.5"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
    else
      s.add_dependency(%q<jekyll>, [">= 3.0.0"])
      s.add_dependency(%q<bundler>, ["~> 1.5"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<jekyll>, [">= 3.0.0"])
    s.add_dependency(%q<bundler>, ["~> 1.5"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
  end
end
