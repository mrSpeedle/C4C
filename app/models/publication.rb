class Publication < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  def likes_count
    reactions.where(kind: 'like').count
  end

  def dislikes_count
    reactions.where(kind: 'dislike').count
  end
end
