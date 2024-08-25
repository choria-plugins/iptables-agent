#!/usr/bin/env rspec

require 'spec_helper'
require File.join(File.dirname(__FILE__), "../../", "files", "mcollective", "validator", "ipaddress_validator.rb")

describe "ipaddress validator" do
  it "should pass for either IPv4 or IPv6 addresses" do
    MCollective::Validator::IpaddressValidator.validate("127.0.0.1").should == true
    MCollective::Validator::IpaddressValidator.validate("::1").should == true
  end

  it "should fail for non IP addresses" do
    lambda { MCollective::Validator::IpaddressValidator.validate("rspec") }.should raise_error("value should be an IP address")
  end
end
