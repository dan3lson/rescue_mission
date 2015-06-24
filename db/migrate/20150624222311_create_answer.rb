class CreateAnswer < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :description, null: false
    end
  end
end
