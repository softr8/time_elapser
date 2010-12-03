##
 # TimeElapser
 # Returns time in windows, making easier to query caching to save results
 ##
class TimeElapser

  # Saninitize current time and returns an starting point of time every interval (in seconds)
  #
  # *Example*
  #
  # If you want to cache results for 5 seconds, do this:
  # 
  # @products = Product.find(:all, :conditions => ['available_date <= ?', TimeElapser.sanitize(5)])
  #
  # If RAILS_ROOT is defined, it will use Time.zone.now, otherwise it will use Time.now
  #
  def self.sanitize interval = 1
    now = (defined?(RAILS_ROOT)) ? Time.zone.now : Time.now
    if interval > 1
      Time.at((now.to_i/interval)*interval)
    else
      now
    end
  end
end