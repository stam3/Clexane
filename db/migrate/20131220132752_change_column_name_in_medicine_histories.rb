class ChangeColumnNameInMedicineHistories < ActiveRecord::Migration
  def up
  	rename_column :medicine_histories, :medicineID, :medicine_id
  end

  def down
  	rename_column :medicine_histories, :medicine_id, :medicineID
  end
end
