class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.references :conversation, null: false, foreign_key: true
      t.references :messagable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
