class CreateSubMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_missions do |t|
        t.references :mission, null: false, foreign_key: true
        t.string :content, null: false
        t.timestamps
    end
  end
end
