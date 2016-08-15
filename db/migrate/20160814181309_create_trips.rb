class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :about
      t.integer :state_id
      t.integer :sport_id
      t.integer :user_id
    end
  end
end
