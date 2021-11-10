class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :url
      t.string :url_slug, index: true
      t.timestamps
    end
  end
end
