class CreateEpisodes < ActiveRecord::Migration[7.1]
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :episode_number
      t.string :picture
      t.float :rating

      t.timestamps
    end
  end
end
