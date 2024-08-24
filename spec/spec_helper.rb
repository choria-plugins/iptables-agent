require 'rubygems'
require 'rspec'
require 'mcollective'
require 'mcollective/test'
require 'mocha'
require 'tempfile'

RSpec.configure do |config|
  config.mock_with :mocha
  config.include(MCollective::Test::Matchers)
  config.raise_errors_for_deprecations!
  config.expect_with(:rspec) { |c| c.syntax = :should }

  config.before :each do
    MCollective::PluginManager.clear
  end
end
