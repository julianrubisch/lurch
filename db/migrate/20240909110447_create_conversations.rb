class CreateConversations < ActiveRecord::Migration[7.2]
  def change
    create_table :conversations do |t|
      t.string :title
      t.text :summary

      t.timestamps
    end
  end
end
