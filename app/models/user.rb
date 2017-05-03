class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :requests
  has_many :projects
  validates :email, uniqueness: true
  # TODO
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
