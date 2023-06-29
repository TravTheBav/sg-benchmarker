class Unit < ApplicationRecord
  belongs_to :attack_benchmark

  validates :unit_type, :quantity, presence: true
end
