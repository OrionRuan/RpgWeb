class CreateHistoria < ActiveRecord::Migration[6.0]
  def change
    create_table :historia do |t|
      t.string :nome
      t.text :texto
      t.string :imagem

      t.timestamps
    end
  end
end
