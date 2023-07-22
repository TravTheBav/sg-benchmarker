class CreateBuildOrderSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :build_order_steps do |t|
      t.string :supply
      t.string :unit
      t.text :description
      t.references :build_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
