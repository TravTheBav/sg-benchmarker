class AttackBenchmark < ApplicationRecord
  belongs_to :user
  has_many :units, dependent: :destroy
  accepts_nested_attributes_for :units,
    reject_if: :all_blank, allow_destroy: true
  validates :map, presence: true

  # formats time attribute into string
  def formatted_time
    time.min.to_s + ":" + time.sec.to_s.rjust(2, '0')
  end

  def formatted_date
    created_at.strftime("%m/%d/%Y")
  end
end
