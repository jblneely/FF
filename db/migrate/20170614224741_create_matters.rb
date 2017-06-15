class CreateMatters < ActiveRecord::Migration[5.1]
  def change
    create_table :matters do |t|
      t.string :title
      t.text :description
      t.date :open
      t.date :close
      t.date :due

      t.timestamps
    end
  end
end
