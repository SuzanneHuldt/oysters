require 'station'
class Journey

  attr_reader :entry_station 
  def start_journey(enter)
    @entry_station = Station.new(enter)
  end

  def end_journey(enter)
    @exit_station = Station.new(enter)
  end

  def complete?
    @exit_station != nil
  end

end
