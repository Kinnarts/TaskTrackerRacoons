class Project < ActiveRecord::Base
  belongs_to :owner, class_name: User
  has_many :tasks
  validates_presence_of :name, :describe, :owner
  accepts_nested_attributes_for :tasks, allow_destroy: true
end
