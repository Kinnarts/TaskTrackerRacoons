class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :assigner, index: true
      t.belongs_to :executor, index: true
      t.belongs_to :project, index: true
      t.string :state
      t.string :title
      t.text :describe
      t.integer :rating

      t.timestamps null: false
    end
  end
end
