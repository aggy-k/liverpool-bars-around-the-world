class Venue < ApplicationRecord
  belongs_to :city
  belongs_to :uploader, class_name: 'User', optional: true
  belongs_to :venue_admin, class_name: 'User', optional: true

  has_many :comments

  has_rich_text :about
  has_many_attached :images, dependent: :detach

  has_many :external_links, -> { order(:type) }, as: :record, dependent: :destroy

  validates :name, :address, :longitude, :latitude, presence: true
  before_save :attach_slug, if: Proc.new { |venue| venue.slug.blank? || venue.will_save_change_to_name? }

  def attach_slug
    self.slug = "wl#{SecureRandom.hex(4)}-#{name.downcase.gsub(/[^a-z\d]/, "-")}"
  end

  def cover_image
    images.attached? ? images.first.url : nil
  end
end
