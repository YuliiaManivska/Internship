class Physician < ApplicationRecord
  validates :first_name, :phone_number, :level, presence: true
  validates :level, inclusion: { in: %w(junior middle senior),
    message: "%{value} is not a valid level" }
  validates :phone_number, format:{ with: /\A\+380\d{9}/,
    message: "%{value} is not a vailid phone number" }
    
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :diagnosis_items
end
