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
      db_query = user.attack_benchmarks.all
    else
      criteria = format_search_criteria(params[:search_criteria])
      db_query = user.attack_benchmarks.where("#{criteria} LIKE ?",
        AttackBenchmark.sanitize_sql_like(params[:query]) + "%"
      )
    end

    if !params[:date_from].blank? && !params[:date_to].blank?
      date_from = DateTime.strptime(params[:date_from], '%Y-%m-%d')
      date_to = DateTime.strptime(params[:date_to], '%Y-%m-%d')
      db_query = db_query.where(created_at: (date_from.beginning_of_day..date_to.end_of_day))
    end

    db_query.order(created_at: :desc)
  end

  private

    # helper for search method
    def self.format_search_criteria(str)
      output = ""
      str.each_char do |char|
        char = "_" if char == " "

        output += char
      end
      output
    end

end
