class Patient < ApplicationRecord
  validates :first_name, :last_name, :age, presence: true
  validates :first_name, :last_name, length: { in 2..25 }
  validates :age, numericality: { only_integer: true,
    message "%{value} is not a valid" }
    
  has_many :appointments
  has_many :physicians, through: :appointments
  has_many :diagnosis_items
  has_many :physicians, through: :diagnosis_items
end
