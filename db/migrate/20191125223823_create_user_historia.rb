class CreateUserHistoria < ActiveRecord::Migration[6.0]
  def change
    create_table :user_historia do |t|
      t.references :historia, index: true, foreign_key: {to_table: :historia}
      t.references :user, null: false, foreign_key: true
      t.integer :livro

      t.timestamps
    end
  end
end
