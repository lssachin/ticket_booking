class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.datetime :screen_date

      t.timestamps
    end
  end
end
