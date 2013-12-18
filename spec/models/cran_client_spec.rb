require 'spec_helper'
require './lib/cran/client'

module Cran
  describe Client do
    let(:client) { Client.new }
    let(:packages_file) { File.open "spec/assets/PACKAGES" }

    describe "fetch" do
      it "gets all packages information in repository"
    end

    describe "#fetch_packages_list" do
      it "gets the list of packages in repository" do
        client.should_receive(:open).and_return packages_file
        packages = client.fetch_packages_list
        packages.should have_at_least(1).package
      end
    end
  end
end
