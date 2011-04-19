class Leafe < ActiveRecord::Base
  belongs_to :employee

  validates :start_date, :presence => true
  validates :end_date, :presence => true
  before_create :check_end_date

  def check_end_date
    self.start_date <= self.end_date
  end

  # This function will show leaves that start from x to y days from today
  def self.show_recent_leaves( x,y )
    Leafe.find(:all, :conditions => ['start_date >= ? AND start_date <= ?', Date.today + x.days, Date.today + y.days])
  end

  def self.show_leaves_today( today )
    Leafe.find(:all, :conditions => ['start_date <= ? AND end_date >= ?', today, today])
  end

  def self.show_past_leaves( num_of_days )
    Leafe.find(:all, :conditions => ['start_date <= ? AND end_date >= ?', Date.today - num_of_days.days, Date.today - num_of_days.days])
  end
end
