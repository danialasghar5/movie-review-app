class AddMovieIdToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :movie_id, :integer
  end
end
