class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.integer :topic_id

      t.timestamps
    end
  end
end
