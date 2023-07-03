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

  # formats data attribute into string
  def formatted_date
    created_at.strftime("%m/%d/%Y")
  end

  def self.search(user, params)
    if params[:query].blank?
      user.attack_benchmarks.all
    else
      criteria = format_search_criteria(params[:search_criteria])
      user.attack_benchmarks.where(
        sanitize_sql_for_conditions(["#{criteria} LIKE ?", "%#{params[:query]}%"]))
    end
  end

  def self.format_search_criteria(str)
    output = ""
    str.each_char do |char|
      char = "_" if char == " "

      output += char
    end
    output
  end
end
