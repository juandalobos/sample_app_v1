class CreateMicroposts < ActiveRecord::Migration[8.0]
  def change
    create_table :microposts do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
