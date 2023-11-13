class ExternalLink < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :record, polymorphic: true

  LINK_TYPES = %w[website facebook instagram twitter tiktok youtube]
  enum :type, LINK_TYPES
  LINK_FAS = [
    "fa-solid fa-globe",
    "fa-brands fa-facebook",
    "fa-brands fa-instagram",
    "fa-brands fa-twitter",
    "fa-brands fa-tiktok",
    "fa-brands fa-youtube"
  ]
end
