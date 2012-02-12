class Block < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user
  validates_presence_of :start_time
  validates_presence_of :end_time
  
  validate :end_time_must_succede_start_time
  
  def end_time_must_succede_start_time
    if end_time <= start_time
      errors.add :end_time, "End time must come after start time"
    end  
  end
  
  def self.current_day_of_week
    days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    time = Time.now
    time -= time.beginning_of_week
    days[((time)/86400).to_i]
  end
  
  def self.current
    puts "Block.current"
    Block.at_time(Block.current_day_of_week,Time.now)
  end
  
  def self.at_time(day,time)
    puts "Block.at_time"
    puts "time=#{time}"
    Block.all.keep_if do |block|
      block.starts_before time and block.ends_after time and day==block.day
    end
  end
  
  def starts_before(time)
    puts "starts_before"
    time.seconds_since_midnight > start_time.seconds_since_midnight
  end
  
  def y2k
    puts "y2k"
    Time.new(2000)
  end
  
  def ends_after(time)
    puts "ends_after"
    time.seconds_since_midnight < end_time.seconds_since_midnight
  end
end