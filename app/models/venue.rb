class Venue < ApplicationRecord
  geocoded_by :address
  # after_validation :geocode
  before_validation :geocode, if: :should_geocode?
  # before_create :geocode, unless: -> (venue) { venue.coordinates_present? }
  belongs_to :city
  belongs_to :uploader, class_name: 'User' #, optional: true
  belongs_to :venue_admin, class_name: 'User', optional: true

  has_many :comments

  has_rich_text :about
  has_many_attached :images, dependent: :detach

  has_many :external_links, -> { order(:type) }, as: :record, dependent: :destroy

  # validates :name, :address, :longitude, :latitude, presence: true
  validates :name, :address, presence: true
  before_save :attach_slug, if: Proc.new { |venue| venue.slug.blank? || venue.will_save_change_to_name? }

  REGIONS = %w[Europe North\ America South\ America Central\ America Asia Australia\ &\ New\ Zealand]

  def attach_slug
    self.slug = "wl#{SecureRandom.hex(4)}-#{name.downcase.gsub(/[^a-z\d]/, "-")}"
  end

  def cover_image
    images.attached? ? images.first.url : nil
  end

  def should_geocode?
    puts "should_geocode? ==> #{address.present? && !coordinates_present?}"
    address.present? && !coordinates_present?
  end

  def coordinates_present?
    longitude.present? && latitude.present?
  end
end
