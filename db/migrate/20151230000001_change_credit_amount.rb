class ChangeCreditAmount < ActiveRecord::Migration
  def change
    change_column :credits, :amount,  :decimal, null:false, default: 0.0, precision: 10
  end

end
