class CreateAttackBenchmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :attack_benchmarks do |t|
      t.time :time
      t.string :map
      t.text :notes
      t.string :match_outcome
      t.string :build_order
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
