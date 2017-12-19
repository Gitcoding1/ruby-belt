class User < ActiveRecord::Base
  has_secure_password
  has_many :groups
  has_many :groups_joined, through: :members
  validates :first_name, :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates :email,
  uniqueness: {case_sensitive: false }, 
  presence:true,
  format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }, on: :update, allow_blank: true;

  def full_name
    self.first_name + " " + self.last_name
  end
end
