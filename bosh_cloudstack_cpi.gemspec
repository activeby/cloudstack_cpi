require File.dirname(__FILE__) + "/lib/cloud/cloudstack/version"

Gem::Specification.new do |s|
  s.name         = "bosh_cloudstack_cpi"
  s.version      = Bosh::CloudStackCloud::VERSION
  s.platform     = Gem::Platform::RUBY
  s.summary      = "BOSH CloudStack CPI"
  s.description  = s.summary
  s.author       = "Viachaslau Markevich"
  s.email        = "viachaslau.markevich@active.by"
  s.homepage     = "http://www.activecloud.ru"
  s.files        = `git ls-files -- lib/*`.split("\n") + %w(README.md Rakefile)
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = "lib"

  s.add_dependency "bosh_common"
  s.add_dependency "bosh_cpi", ">= 0.4.2"
  s.add_dependency "uuidtools"
end
