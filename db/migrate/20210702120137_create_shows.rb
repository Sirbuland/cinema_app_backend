class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.datetime :time
      t.references :movie, index: true
      t.float :price

      t.timestamps
    end
  end
end
