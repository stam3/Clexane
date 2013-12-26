class CreateMedicineHistories < ActiveRecord::Migration
  def change
    create_table :medicine_histories do |t|
      t.timestamp :actualHour
      t.integer :type
      t.boolean :isFirstHour
      t.integer :medicineID

      t.timestamps
    end
  end
end
