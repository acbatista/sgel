class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :points
      t.index [:user_id, :book_id], unique: true
      t.timestamps null: false
    end
  end
end
