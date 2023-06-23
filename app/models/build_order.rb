class BuildOrder < ApplicationRecord
  belongs_to :user
  has_many :build_order_steps, dependent: :destroy
  accepts_nested_attributes_for :build_order_steps,
    reject_if: :all_blank, allow_destroy: true
end
