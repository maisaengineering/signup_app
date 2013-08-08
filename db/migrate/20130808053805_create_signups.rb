class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :email
      t.integer :zipcode

      t.timestamps
    end
  end
end
