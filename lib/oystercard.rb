require_relative 'journey'

class OysterCard
  MINIMUM_FARE = 1
  MAX_BALANCE = 90
  attr_reader :balance, :entry_station, :exit_station, :journeys
    
  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(money)
    fail "Exceeds maximum balance of #{MAX_BALANCE}" if max_balance?(money)
    @balance += money
  end

  def in_journey?
   @entry_station.nil? ? false : true
  end

  def touch_in(entry_station)
    fail 'You need to top up' if @balance < MINIMUM_FARE

    @entry_station = entry_station
    @in_journey = true
  end 

  def touch_out(exit_station)
    @exit_station = exit_station
    deduct(MINIMUM_FARE)
    journey_log
    @entry_station = nil
  end 

  def journey_log
    @journeys << { entry: @entry_station, exit: @exit_station }
  end

 private

  def max_balance?(money)
    @balance + money > MAX_BALANCE
  end

  def deduct(money)
    @balance -= money
  end


end