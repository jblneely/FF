class CreateActionsMatters < ActiveRecord::Migration[5.1]
  def change
    create_table :actions_matters do |t|
      t.references :action, foreign_key: true
      t.references :matter, foreign_key: true

      t.timestamps
    end
  end
end
