class CreateBetCups < ActiveRecord::Migration[6.0]
  def change
    create_table :bet_cups do |t|
      t.text :name
      t.text :description
      t.integer :owner_id
      t.integer :status

      t.timestamps
    end
  end
end
