class AddCountToUrlTable < ActiveRecord::Migration[5.0]
  def change
      change_table :urls do |t|
          t.integer :count, default: 0
      end
  end
end
