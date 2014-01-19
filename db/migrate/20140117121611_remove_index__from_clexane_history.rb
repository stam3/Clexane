class RemoveIndexFromClexaneHistory < ActiveRecord::Migration
  def up
  	    remove_column :clexane_histories, :index
  end

  def down
  end
end
