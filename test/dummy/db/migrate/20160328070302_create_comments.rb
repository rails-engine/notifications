class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :topic_id
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
