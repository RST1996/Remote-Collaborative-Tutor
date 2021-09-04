class User < ApplicationRecord
	#has_many :courses
	validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
		 
	has_many :enrollments
	has_many :courses, :through => :enrollments
	has_many :posts
	has_many :comments
	has_many :tutors
	has_many :requests
	has_many :messages
	has_many :conversations, foreign_key: :sender_id
end
