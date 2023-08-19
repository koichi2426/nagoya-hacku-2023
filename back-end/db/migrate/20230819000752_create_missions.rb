class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
        t.integer :mission_id, null: false
        t.string :mission_title, null: false
        t.integer :progress, null: false

        t.timestamps
    end
  end
end
