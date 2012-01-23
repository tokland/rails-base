class CreateDieselClearanceUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.string :confirmation_token
      t.string :remember_token
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
