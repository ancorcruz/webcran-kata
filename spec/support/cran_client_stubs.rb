module Cran
  class Client
    private
    def get_packages_list
      File.open("spec/assets/PACKAGES").read
    end

    def get_package name, version
      File.open("spec/assets/ABCExtremes_1.0.tar.gz")
    end
  end
end
