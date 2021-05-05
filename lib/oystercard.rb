class OysterCard
  MINIMUM_FARE = 1
  MAX_BALANCE = 90
  attr_reader :balance, :in_journey, :entry_station
    
  def initialize
    @balance = 0
    @in_journey = false
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

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
    @entry_station = nil
  end 

 private

  def max_balance?(money)
    @balance + money > MAX_BALANCE
  end

  def deduct(money)
    @balance -= money
  end

end

oystercard = OysterCard.new
p oystercard.in_journey?