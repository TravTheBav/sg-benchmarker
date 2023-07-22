class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :unit_type
      t.integer :quantity
      t.references :attack_benchmark, null: false, foreign_key: true

      t.timestamps
    end
  end
end
