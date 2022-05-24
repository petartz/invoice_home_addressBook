class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :town
      t.string :zip_code
      t.string :state
      t.string :country
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
