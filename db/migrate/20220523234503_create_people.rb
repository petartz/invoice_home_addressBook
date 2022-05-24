class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :salutation
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :ssn
      t.string :birth_date
      t.text :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
