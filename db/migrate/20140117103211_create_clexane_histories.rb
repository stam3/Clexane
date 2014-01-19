class CreateClexaneHistories < ActiveRecord::Migration
  def change
    create_table :clexane_histories do |t|
      t.timestamp :shotDate
      t.integer :dosage
      t.boolean :isRight
      t.integer :user_id
      t.string :index

      t.timestamps
    end
  end
end
