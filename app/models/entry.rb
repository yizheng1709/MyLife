class Entry < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :date
    #has title, content, date
end