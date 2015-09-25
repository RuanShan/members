class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
    end

    create_table :roles_users, :id => false do |t|
      t.references :role
      t.references :user
    end

    add_index :roles_users, [:role_id], :name => 'index_roles_users_on_role_id'
    add_index :roles_users, [:user_id], :name => 'index_roles_users_on_user_id'
  end
end
