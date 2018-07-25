class CreateUserColors < ActiveRecord::Migration[5.2]
  def change
    create_table :user_colors do |t|
      t.string :color_code
      t.integer :row
      t.integer :col
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
