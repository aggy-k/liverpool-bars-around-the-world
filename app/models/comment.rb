class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  belongs_to :parent, class_name: 'Comment', optional: true, counter_cache: :replies_count
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id'
  validates :body, presence: true, length: { minimum: 3 }

  # counter_culture :comment, column_name: proc {|model| !model.is_deactivated && model.destroyed_at.nil? && model.trail_share? ? 'shares_count' : nil }

  scope :parents, -> { where(parent_id: nil) }
  scope :latest, -> { parents.order(:created_at => :desc) }
  scope :top, -> { parents.order(:votes => :desc) }
end
