class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      t.belongs_to :user
      t.string :caption
      
      t.timestamps
    end
  end
end
