class CreateBuildOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :build_orders do |t|
      t.string :name
      t.string :faction
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
