
class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :creator_id, default: 0 # who made, current user
      t.integer :user_id, null: false
      t.decimal :amount, null:false, default: 0.0, precision: 2
      t.integer :deal_type, default: 1 # 0 out, 1, in
      t.string :deal_action, limit: 24
      t.integer :status, default: 0
      t.string :notes

      t.timestamps
    end
  end
end
