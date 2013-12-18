require 'dcf'
require 'open-uri'

module Cran
  class Client
    def self.get_packages_list
      cran_uri = "http://cran.r-project.org/src/contrib/PACKAGES"
      packages = Dcf.parse open(cran_uri).read
    end
  end
end
