class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :type
      t.string :quantity
      t.belongs_to :attack_benchmark, null: false, foreign_key: true

      t.timestamps
    end
  end
end
