require './lib/cran/client'

namespace :cran do
  desc "Populate db with package information from cran repository"
  task :populate => :environment do
    Cran::Client.fetch do |package_info|
      Package.find_or_create_from_cran package_info
    end
  end
end
