class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      t.belongs_to :user
      t.string :name
      t.string :description
      
      t.timestamps
    end
  end
end
