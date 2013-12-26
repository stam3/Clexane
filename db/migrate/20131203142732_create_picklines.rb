class CreatePicklines < ActiveRecord::Migration
  def change
    create_table :picklines do |t|
      t.date :red_last_wash_date
      t.date :blue_last_wash_date
      t.date :bandage_replacement_date
      t.date :blue_ventile_replacement_date
      t.date :red_ventile_replacement_date
      t.integer :bandage_interval_days
      t.date :parpar_replacement_date
      t.integer :user_id

      t.timestamps
    end
  end
end
