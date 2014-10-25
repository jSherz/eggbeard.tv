class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :user
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
