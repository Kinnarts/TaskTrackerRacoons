class Task < ActiveRecord::Base
  belongs_to :assigner, class_name: User
  belongs_to :executor, class_name: User
  belongs_to :project
  acts_as_taggable
  validates_presence_of :title, :describe, :executor, :assigner
  state_machine initial: :created do
    state :working
    state :for_test
    state :testing
    state :for_fix
    state :finished

    event :create do
      transition nil => :created
    end
    
    event :in_work do
      transition :created => :working
    end

    event :done do
      transition :working => :for_test
    end

    event :in_test do
      transition :for_test => :testing
    end

    event :tested do
      transition :testing => :for_fix
    end

    event :complete do
      transition :testing => :finished
    end

    event :in_fix do
      transition :for_fix => :working
    end
  end
end
