class Block < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user
  validates_presence_of :start_time
  validates_presence_of :end_time
  
  
  
  def end_time_must_succede_start_time
    end_time > start_time  
  end
end
