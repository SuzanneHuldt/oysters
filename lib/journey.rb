require 'station'
class Journey
MINIMUM_FARE = 1
PENALTY = 6
  attr_accessor :entry_station, :exit_station, :current_journey

  def initialize
    @entry_station = nil
    @exit_station = nil
    @current_journey = []
  end

  def start_journey(enter)
    @entry_station = enter
    #= Station.new(enter)
  end

  def end_journey(enter)
    @exit_station = enter
    append_journey
  end

  def append_journey
    @current_journey << {entry: @entry_station, exit: @exit_station}
  end

  #def complete?
  #  @exit_station != nil
  #end

  def fare
    if @exit_station == nil
      PENALTY
    else
      MINIMUM_FARE
    end
  end

end
