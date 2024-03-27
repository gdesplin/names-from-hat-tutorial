class CreateNames < ActiveRecord::Migration[7.1]
  def change
    create_table :names do |t|
      t.references :hat, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end

    add_index :names, [:hat_id, :name], unique: true
  end
end
