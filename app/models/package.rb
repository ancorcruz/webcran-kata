class Package < ActiveRecord::Base
  serialize :data
  validates :name, :version, presence: true, uniqueness: true

  def self.find_or_create_from_cran info
    find_by_name_and_version(info["Package"], info["Version"]) || create_from_cran(info)
  end

  def self.create_from_cran info
    attributes = {
      name:        info["Package"],
      title:       info["Title"],
      description: info["Description"],
      version:     info["Version"],
      authors:     info["Author"],
      maintainers: info["Maintainer"],
      data:        info
    }

    create attributes
  end
end
