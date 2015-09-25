
class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :owner_id, default: 0 #
      t.integer :user_id, null: false
      t.decimal :amount, null:false, default: 0.0, precision: 2
      t.string :notes

      t.timestamps
    end
  end
end
