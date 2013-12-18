require 'dcf'
require 'open-uri'
require 'zlib'
require 'rubygems/package'

module Cran
  class Client
    def self.fetch base_uri = "http://cran.r-project.org/src/contrib/"
      new(base_uri).fetch
    end

    def initialize base_uri
      @base_uri = base_uri
    end

    def fetch
      fetch_packages_list.map do |package|
        package_information = fetch_package_description package["Package"], package["Version"]
        package.merge package_information
      end
    end

    def fetch_packages_list
      Dcf.parse get_packages_list
    end

    def fetch_package_description name, version
      tar_file    = Gem::Package::TarReader.new(Zlib::GzipReader.open get_package name, version)
      description = tar_file.seek("#{name}/DESCRIPTION") { |entry| entry.read }
      tar_file.close

      Dcf.parse(description).first
    end


    private

    def get_packages_list
      open("#{@base_uri}PACKAGES").read
    end

    def get_package name, version
      open("#{@base_uri}#{name}_#{version}.tar.gz").read
    end
  end
end
