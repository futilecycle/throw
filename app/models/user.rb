class User < ActiveRecord::Base
  has_many :blocks, dependent: :destroy
end
