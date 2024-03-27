class CreateNameMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :name_matches do |t|
      t.references :drawing, null: false, foreign_key: true
      t.references :giver, null: false, foreign_key: { to_table: :names }
      t.references :receiver, null: false, foreign_key: { to_table: :names }

      t.timestamps
    end

    add_index :name_matches, [:drawing_id, :giver_id], unique: true
    add_index :name_matches, [:drawing_id, :receiver_id], unique: true
  end
end
