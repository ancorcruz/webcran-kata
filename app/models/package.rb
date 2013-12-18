class Package < ActiveRecord::Base
  serialize :data
  validates :name, :version, presence: true, uniqueness: true

  def self.find_or_create_from_cran info
    find_by_name_and_version(info["Package"], info["Version"]) || create_from_cran(info)
  end

  def self.create_from_cran info
    # Hack to fix encoding issues (Some packages have it)
    sanitized_info = info.inject({}) do |hash, entry|
      hash.merge({ entry.first => entry.last.force_encoding('UTF-8') })
    end

    attributes = {
      name:        sanitized_info["Package"],
      title:       sanitized_info["Title"],
      description: sanitized_info["Description"],
      version:     sanitized_info["Version"],
      authors:     sanitized_info["Author"],
      maintainers: sanitized_info["Maintainer"],
      data:        sanitized_info
    }

    create attributes
  end
end
