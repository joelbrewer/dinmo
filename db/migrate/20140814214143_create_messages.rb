class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :conversation_id

      t.timestamps
    end
  end
end
