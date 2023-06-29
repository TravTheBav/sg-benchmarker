class BuildOrderStep < ApplicationRecord
  belongs_to :build_order

  validates :supply, :unit, presence: true
end
