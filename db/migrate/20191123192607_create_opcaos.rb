class CreateOpcaos < ActiveRecord::Migration[6.0]
  def change
    create_table :opcaos do |t|
      t.references :paihistoria, index: true, foreign_key: {to_table: :historia}
      t.references :filhahistoria, index: true, foreign_key: {to_table: :historia}
      t.text :texto

      t.timestamps
    end
  end
end
