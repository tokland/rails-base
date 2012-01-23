class AddUserSettings < ActiveRecord::Migration
  def self.up
    add_column :users, :settings, :text
  end

  def self.down
    drop_column :users, :settings
  end
end
