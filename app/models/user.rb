class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  

  has_many :build_orders, dependent: :destroy
  has_many :attack_benchmarks, dependent: :destroy
  has_one :profile_picture
  has_one :avatar, through: :profile_picture

  def admin?
    admin
  end

  def get_avatar
    return 'default.png' unless avatar
    
    avatar
  end
end
