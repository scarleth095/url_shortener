class ChangeUrlTable < ActiveRecord::Migration[5.0]
  def change
      change_table :urls do |t|
          t.remove :short_url_key
      end
  end
end
