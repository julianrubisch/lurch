class CreateReplies < ActiveRecord::Migration[7.2]
  def change
    create_table :replies do |t|
      t.text :body
      t.references :prompt
      t.integer :status

      t.timestamps
    end
  end
end
