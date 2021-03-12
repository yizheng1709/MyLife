class Entry < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :date
    validates_presence_of :content
    #has title, content, date
end