require 'spec_helper'
require './lib/cran/client'

module Cran
  describe Client do
    let(:client) { Client.new 'url' }
    let(:packages_file) { File.open("spec/assets/PACKAGES").read }
    let(:package_file)  { File.open("spec/assets/ABCExtremes_1.0.tar.gz") }

    before do
      Client.stub(:fetch) { client.fetch }
      client.stub(:get_packages_list).and_return packages_file
      client.stub(:get_package).and_return       package_file
    end

    describe "#fetch" do
      it "gets all packages information in repository" do
        package = Client.fetch.first
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
