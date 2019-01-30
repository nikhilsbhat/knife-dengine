# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "knife-dengine/version"

Gem::Specification.new do |s|
  s.name        = 'knife-dengine'
  s.version     = Knife::Dengine::VERSION
  s.authors     = ["Nikhil Bhat", "Ranjith Janagama"]
  s.email       = ["nikhilsbhat93@gmail.com", "ranjithjanagama9@gmail.com"]
  s.homepage    = 'https://github.com/nikhilsbhat/plugins'
  s.summary     = "Chef's Knife Command to provision resources in multiple cloud"
  s.description = s.summary
  s.files       = %w{LICENSE} + Dir.glob("lib/**/*")
  s.license     = 'GPL-3.0'
 
  s.add_dependency "aws-sdk", ">= 2.11.80"
  s.add_dependency "knife-ec2", ">= 0.15.0"
  s.add_dependency "fog-azure-rm", ">=0.3.2"
  s.add_dependency "fog-core", ">=1.43.0"
 
  s.require_paths = ["lib"]
end
