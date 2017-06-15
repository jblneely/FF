class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.text :title
      t.text :description
      t.date :open
      t.date :completed
      t.text :duration
      t.text :location

      t.timestamps
    end
  end
end
