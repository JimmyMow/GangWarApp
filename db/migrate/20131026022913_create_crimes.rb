class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.string :description
      t.string :date
      t.string :location_description
      t.string :block
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
