class CreatePrompts < ActiveRecord::Migration[7.2]
  def change
    create_table :prompts do |t|
      t.string :model
      t.text :body

      t.timestamps
    end
  end
end
