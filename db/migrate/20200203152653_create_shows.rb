class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.datetime :show_date
      t.references :movie, foreign_key: true
      t.references :theater
      t.time :show_time
      t.integer :price

      t.timestamps
    end
  end
end
