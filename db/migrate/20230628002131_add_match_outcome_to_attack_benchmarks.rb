class AddMatchOutcomeToAttackBenchmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :attack_benchmarks, :match_outcome, :string
  end
end
