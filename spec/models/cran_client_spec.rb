require 'spec_helper'
require './lib/cran/client'

module Cran
  describe Client do
    describe "get_packages_list" do
      it "gets the list of packages in repository" do
        Client.should_receive(:open).and_return(File.open "spec/assets/PACKAGES")
        packages = Client.get_packages_list
        packages.should have_at_least(1).package
      end
    end
  end
end
