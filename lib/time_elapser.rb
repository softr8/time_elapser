class TimeElapser
  def self.sanitize interval = 1
    now = (defined?(RAILS_ROOT)) ? Time.zone.now : Time.now
    if interval > 1
      Time.at((now.to_i/interval)*interval)
    else
      now
    end
  end
end