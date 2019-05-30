class Artist < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
    include PgSearch
  pg_search_scope :search_by_name_and_genre,
    against: [ :name, :genre ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
