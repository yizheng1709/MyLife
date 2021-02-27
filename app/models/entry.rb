class Entry < ActiveRecord::Base
    belongs_to :user
    #should have a DateTime attribute (year, month, date, hour)
    validates_presence_of :date
end