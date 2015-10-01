class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :type
      t.integer :team_id
      t.string :name, :limit => 100, :null => false
      t.string :position, :limit => 50
      t.integer :number, :null => false , :default => 0
      t.boolean :retired, :default => false
      t.boolean :injured, :default => false
      t.boolean :suspended, :default => false
      t.date :born_on
      t.datetime :deleted_at
      t.text :notes

      #private information
      t.string :account, :limit => 36
      t.string :parent_account, :limit => 36
      t.string :cellphone, :limit => 16
      t.string :card_num, :limit => 36  # id card number
      t.string :bank_name, :limit => 36  # bank card number
      t.string :bank_num, :limit => 36  # bank card number
      t.string :sms_num, :limit => 16   # cellphone for sms
      t.string :address, :limit => 100  # cellphone for sms
      t.string :company_address, :limit => 100  # cellphone for sms

      #nested set
      t.integer :parent_id, :null => true, :index => true
      #t.integer :lft, :null => false, :index => true
      #t.integer :rgt, :null => false, :index => true

      #:database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
      ## Database authenticatable
       t.string :email,              :null => false, :default => ""
       t.string :encrypted_password, :null => false, :default => ""

       ## Recoverable
       t.string   :reset_password_token
       t.datetime :reset_password_sent_at

       ## Rememberable
       t.datetime :remember_created_at

       ## Trackable
       t.integer  :sign_in_count, :default => 0
       t.datetime :current_sign_in_at
       t.datetime :last_sign_in_at
       t.string   :current_sign_in_ip
       t.string   :last_sign_in_ip

       ## Encryptable
       t.string :password_salt

       ## Confirmable
       # t.string   :confirmation_token
       # t.datetime :confirmed_at
       # t.datetime :confirmation_sent_at
       # t.string   :unconfirmed_email # Only if using reconfirmable

       ## Lockable
       t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
       t.string   :unlock_token # Only if unlock strategy is :email or :both
       t.datetime :locked_at

       # Token authenticatable
       t.string :authentication_token

       ## Invitable
       t.string :invitation_token

       t.timestamps null: false
    end

    add_index :users, :email, :unique => true
    add_index :users, :reset_password_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
