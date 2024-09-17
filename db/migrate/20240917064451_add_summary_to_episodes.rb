class AddSummaryToEpisodes < ActiveRecord::Migration[7.1]
  def change
    add_column :episodes, :summary, :string
  end
end
