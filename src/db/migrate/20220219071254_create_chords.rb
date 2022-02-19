class CreateChords < ActiveRecord::Migration[6.1]
  def change
    create_table :chords do |t|
      t.integer :user_id
      t.string :title
      t.string :work
      t.text :body

      t.timestamps
    end
  end
end
