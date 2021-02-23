class Entry < ActiveRecord::Base
    belongs_to :user
    #should have a DateTime attribute (year, month, date, hour)
end