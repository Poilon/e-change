class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :note
      t.text :comment
      t.integer :time
      t.timestamps
    end
  end
end
