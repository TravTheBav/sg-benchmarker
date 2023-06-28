class AttackBenchmark < ApplicationRecord
  belongs_to :user

  # formats time attribute into string
  def formatted_time
    time.min.to_s + ":" + time.sec.to_s.rjust(2, '0')
  end
end
