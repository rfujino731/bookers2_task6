class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, presence: true,length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50}

  attachment :profile_image, destroy: false

  has_many :books
  has_many :book_comments, dependent: :destroy
  has_many :favorite, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower 
  # railsのルールなら、source :followerは省略できるが(followersの単数形なので)、 
  # source: :followedとの対比を
  # 分かり易くするためにあえて記述
  def following?(other_user)
      following.include?(other_user)
  end
end
