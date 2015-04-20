class CreateReviewLikes < ActiveRecord::Migration
  def change
    create_table :review_likes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :review, index: true

      t.timestamps null: false
    end
  end
end
