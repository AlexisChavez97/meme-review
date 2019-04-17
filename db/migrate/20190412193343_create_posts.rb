class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, index: { unique: true }
      t.belongs_to :user
      t.belongs_to :meme

      t.timestamps
    end
  end
end
