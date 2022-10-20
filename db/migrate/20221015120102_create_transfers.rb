class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.integer :amount
      t.references :sender, null:false, foreign_key: { to_table: :customers }
      t.references :receiver, null:false, foreign_key: { to_table: :customers }

      t.timestamps
    end
  end
end
