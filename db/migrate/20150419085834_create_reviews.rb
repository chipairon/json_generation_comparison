class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :user, index: true
      t.integer :rating
      t.string :abstract
      t.text :text

      t.timestamps null: false
    end
  end
end
