class CreateDrawings < ActiveRecord::Migration[7.1]
  def change
    create_table :drawings do |t|
      t.references :hat, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end

    add_index :drawings, [:hat_id, :name], unique: true
  end
end
