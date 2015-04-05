class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :note
      t.boolean :completed
      t.date :completed_on

      t.timestamps null: false
    end
  end
end
