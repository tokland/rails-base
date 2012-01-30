class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :language
      t.string :slug
      t.string :key
      t.string :title
      t.text :body
      t.text :body_html
      t.string :status

      t.timestamps
    end
  end
end
