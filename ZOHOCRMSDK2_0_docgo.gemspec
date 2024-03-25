# frozen_string_literal: true

src = File.expand_path('src', __dir__)
$LOAD_PATH.unshift(src) unless $LOAD_PATH.include?(src)
require 'version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 2.6'
  spec.name = 'ZOHOCRMSDK2_0_docgo'
  spec.version       = ZOHOCRMSDK::VERSION
  spec.licenses       = ['Apache-2.0']
  spec.authors       = ['ZOHO CRM API TEAM','DocGo Engineering']
  spec.metadata["source_code_uri"] = "https://github.com/AmbulnzLLC/zohocrm-ruby-sdk-2.0-docgo"
  spec.summary       = 'API client for Zoho CRM - DOCGO FORK of ZOHOCRMSDK2_0'
  spec.homepage      = 'https://github.com/AmbulnzLLC/zohocrm-ruby-sdk-2.0-docgo'
  spec.files = Dir['src/**/*']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['src']
  spec.add_runtime_dependency 'cgi', '~> 0.1'
  spec.add_runtime_dependency 'csv', '~> 3.0'
  spec.add_runtime_dependency 'json', '~> 2.0'
  spec.add_runtime_dependency 'multipart-post', '~> 2.0'
  spec.add_runtime_dependency 'rest-client', '~> 2.0'
  spec.add_runtime_dependency 'uri', '~> 0.10'
end
