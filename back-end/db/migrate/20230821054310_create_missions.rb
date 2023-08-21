class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
        t.string :title, null: false 
        t.integer :progress, null: false
        t.timestamps
    end
  end
end
