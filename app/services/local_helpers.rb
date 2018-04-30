module LocalHelpers
  
  TIME_UNTIL_REFRESH_DATA = 1.day

  def stale_date
    Time.zone.now - TIME_UNTIL_DATA_REFRESH
  end

end
