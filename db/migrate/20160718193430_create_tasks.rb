class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :list,   foreign_key: true
      t.boolean :complete,  null: false
      t.text :body,         null: false
      t.integer :position,  null: false

      t.timestamps
    end
  end
end
