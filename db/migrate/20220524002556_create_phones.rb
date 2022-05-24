class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :phone_number
      t.text :comment
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
