class Patient < ApplicationRecord
  validates :first_name, :last_name, :age, presence: true
  validates :first_name, :last_name, length: { in: 2..25 }
  validates :email, format:{ with: /@/,
  message: "%{value} is not a vailid email" }
  validates :age, numericality: { only_integer: true,
    message: "%{value} is not a valid", in: 6..99 }
    
  has_many :appointments
  has_many :physicians, through: :appointments
  has_many :diagnosis_items
end
