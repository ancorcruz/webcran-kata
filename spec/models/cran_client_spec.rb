require 'spec_helper'
require './lib/cran/client'

module Cran
  describe Client do
    let(:client) { Client.new 'url' }

    describe "#fetch" do
      it "gets all packages information in repository" do
        package = Client.fetch { |package| package }.first
        package['Description'].should_not be_empty
      end
    end

    describe "#fetch_packages_list" do
      it "gets the list of packages in repository" do
        packages = client.fetch_packages_list
        packages.should have_at_least(1).package
      end
    end

    describe "#fetch_package_description" do
      it "returns the package information hash" do
        package_description = client.fetch_package_description "ABCExtremes", "1.0"
        package_description['Description'].should_not be_empty
      end
    end
  end
end
