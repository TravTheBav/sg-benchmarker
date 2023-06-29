class ChangeQuantityToIntegerTypeInUnits < ActiveRecord::Migration[7.0]
  change_column :units, :quantity, :integer
end
