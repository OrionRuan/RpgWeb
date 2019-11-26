class CreateUserHistoria < ActiveRecord::Migration[6.0]
  def change
    create_table :user_historia do |t|
      t.references :historia, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
