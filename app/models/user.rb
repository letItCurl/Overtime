class User < ApplicationRecord
  has_many :posts
  has_many :audit_logs

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :phone
  PHONE_REGEX = /\d{10}/
  validates_format_of :phone, with: PHONE_REGEX
  
  validates :phone, length: {is: 10}

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end

end
