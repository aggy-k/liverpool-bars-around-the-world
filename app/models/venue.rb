class Venue < ApplicationRecord
  belongs_to :city
  belongs_to :uploader, class_name: 'User', optional: true
  belongs_to :venue_admin, class_name: 'User', optional: true

  has_rich_text :about
  has_many_attached :images, dependent: :detach

  def cover_image
    images.attached? ? images.first.url : nil
  end
end
