require 'spec_helper'

describe Package do
  let(:package_from_cran) { Cran::Client.fetch.first }

  describe "::create_from_cran" do
    it "creates a new package" do
      lambda {
        Package.create_from_cran package_from_cran
      }.should change(Package, :count).by(1)
    end
  end

  describe "::find_or_create_from_cran" do
    it "creates the package when is not already in the database" do
      lambda {
        Package.find_or_create_from_cran package_from_cran
      }.should change(Package, :count).by(1)

      lambda {
        Package.find_or_create_from_cran package_from_cran
      }.should_not change(Package, :count)
    end
  end
end
