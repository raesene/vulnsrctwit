class User < ActiveRecord::Base
  has_many :posts
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :description, :username
  # attr_accessible :title, :body
  validates :username, presence: true, uniqueness: true

  has_many :followeds, :class_name => "Following", :foreign_key => "follower_id"
  has_many :follows, :through => :followeds, :source => :user
  has_many :followings
  has_many :followers, :through => :followings
  has_many :mentions
  has_many :mentioned_ins, :through => :mentions, :source => :post
  has_one :channel, :as => :broadcastable

  def timeline
    Post.includes(:user).where(:user_id => Following.where(:follower_id => self.id).collect(&:user_id) << self.id).order("created_at DESC")
  end
end
