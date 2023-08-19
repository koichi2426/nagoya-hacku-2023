class CreateSubMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_missions do |t|
        t.integer :mission_id, null: false
        t.integer :submission_id, null: false
        t.string :submission_content, null: false

        t.timestamps
    end
  end
end
