class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
        t.string :long_url, null: false
        t.string :short_url_key , uniqueness: true, null: false
        t.timestamps
    end
  end
end
