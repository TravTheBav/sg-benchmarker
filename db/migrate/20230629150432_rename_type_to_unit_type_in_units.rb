class RenameTypeToUnitTypeInUnits < ActiveRecord::Migration[7.0]
  change_table :units do |t|
    t.rename :type, :unit_type
  end
end
