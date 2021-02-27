class Organizer < ActiveRecord::Base
    belongs_to :user
    has_many :tasks
    validates_presence_of :date_of_tasks
end