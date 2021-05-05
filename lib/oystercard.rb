class OysterCard

  MAX_BALANCE = 90
  attr_reader :balance, :in_journey
    
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    fail "Exceeds maximum balance of #{MAX_BALANCE}" if max_balance?(money)
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
    'touched in'
  end 

  def touch_out
  @in_journey = false
  'touched out'
  end 

 private

  def max_balance?(money)
    @balance + money > MAX_BALANCE
  end

end