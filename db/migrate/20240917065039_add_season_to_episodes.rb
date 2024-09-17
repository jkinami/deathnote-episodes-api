class AddSeasonToEpisodes < ActiveRecord::Migration[7.1]
  def change
    add_column :episodes, :season, :integer
  end
end
