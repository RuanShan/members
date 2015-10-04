class RenameRoles < ActiveRecord::Migration
  def change
    rename_column(:users, :roles, :unused_roles)
  end
end
