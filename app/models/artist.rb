class Artist < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  include PgSearch
  multisearchable against: [:name, :genre]
end

  # include PgSearch
  # pg_search_scope :search_by_name, against: [:name], using: {
  #   tsearch: { prefix: true }
  # }
