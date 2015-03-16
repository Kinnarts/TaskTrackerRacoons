class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :describe
      t.belongs_to :owner, index: true

      t.timestamps null: false
    end
  end
end
