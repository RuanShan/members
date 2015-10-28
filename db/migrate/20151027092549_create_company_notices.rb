class CreateCompanyNotices < ActiveRecord::Migration
  def change
    create_table :company_notices do |t|
      t.string :title
      t.text :body
      t.timestamps
    end

  end
end
