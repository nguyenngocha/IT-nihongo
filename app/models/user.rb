class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, allow_destroy: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true

  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: "follower_id",
    dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: "followed_id",
    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow other_user
    active_relationships.create followed_id: other_user.id
  end

  def is_user? user
    self == user
  end

  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def following? other_user
    following.include? other_user
  end

  enum gender: [:male, :female]
  enum role: [:user, :admin]

  ratyrate_rater

  def password_required?
    new_record? ? super : false
  end
end
