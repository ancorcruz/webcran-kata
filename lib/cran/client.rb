require 'dcf'
require 'open-uri'

module Cran
  class Client
    def self.fetch
      new.fetch
    end

    def fetch
      fetch_packages_list
      # Gets extra info of each package from DESCRIPTION file
    end

    def fetch_packages_list
      Dcf.parse get_packages_list
    end


    private

    def get_packages_list
      open("http://cran.r-project.org/src/contrib/PACKAGES").read
    end
  end
end
