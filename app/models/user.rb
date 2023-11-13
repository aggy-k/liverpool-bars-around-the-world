class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :venues, foreign_key: :uploader_id
  has_one_attached :avatar

  def familiar_name
    return username || email if first_name.blank? && last_name.blank?
    "#{first_name if first_name.present?}#{last_name.present? ? (' ' + last_name.first + '.') : ''}".strip
  end

  def full_name
    return username || email if first_name.blank? && last_name.blank?
    "#{first_name if first_name.present?}#{last_name if last_name.present?}".strip
  end
end
