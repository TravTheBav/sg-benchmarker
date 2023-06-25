class CreateAttackBenchmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :attack_benchmarks do |t|
      t.time :time
      t.string :map
      t.text :notes
      t.references :user, null: false, foreign_key: true
      t.references :build_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
