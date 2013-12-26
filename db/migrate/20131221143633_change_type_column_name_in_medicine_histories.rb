class ChangeTypeColumnNameInMedicineHistories < ActiveRecord::Migration
  def up
  	rename_column :medicine_histories, :type, :c_type
  end

  def down
    rename_column :medicine_histories, :c_type, :type

  end
end
