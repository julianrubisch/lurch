class CreateReplies < ActiveRecord::Migration[7.2]
  def change
    create_table :replies do |t|
      t.integer :rating

      t.timestamps
    end
  end
end
