class AddOriginalUrlColumnInLink < ActiveRecord::Migration[6.1]
  def change
    rename_column :links, :url, :original_url
    add_column :links, :sluged_url, :string
  end
end
