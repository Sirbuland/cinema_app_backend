class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :star_rating
      t.string  :review
      t.references :movie
      t.references :user

      t.timestamps
    end
  end
end
