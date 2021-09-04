class Course < ApplicationRecord
	belongs_to :user
	has_many :contents
	has_many :enrollments
	has_many :posts
	has_many :tutors
	has_many :requests
	has_many :users, :through => :enrollments
	validates :name, length: {maximum: 40 }, presence: true
	validates :description, presence: true
	#validates :teacher_id, presence:true
	scope :of_teacher, lambda{
		|uid| where(:user_id => uid)
	}
end
