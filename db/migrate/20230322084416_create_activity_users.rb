class CreateActivityUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_users do |t|
      t.belongs_to :activity, index: true 
      t.belongs_to :user, index: true
      t.string :duration 
      t.date :date

      t.timestamps
    end
  end
end
