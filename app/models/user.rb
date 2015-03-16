class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, foreign_key: :owner_id
  has_many :tasks, foreign_key: :executor_id
  has_many :created_tasks, class_name: Task, foreign_key: :assigner_id
end
