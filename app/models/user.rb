class User < ActiveRecord::Base
  has_many :blocks, dependent: :destroy
  
  validates :email, presence: true
end
