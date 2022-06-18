module Commentable
  extend ActiveSupport::Concern

  def comment(msg)
    byebug
    puts msg
  end
end
