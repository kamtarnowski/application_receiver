class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :description
      t.string :category
      t.string :email

      t.timestamps null: false
    end
  end
end
