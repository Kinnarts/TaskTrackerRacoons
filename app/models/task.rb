class Task < ActiveRecord::Base
  belongs_to :assigner, class_name: User
  belongs_to :executor, class_name: User
  belongs_to :project
  acts_as_taggable
end
