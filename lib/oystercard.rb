 class Oystercard
  MAX_BALANCE = 90
  attr_reader :balance
    
  def initialize
    @balance = 0
  end
  
  def top_up(money)
    fail "Exceeds maximum balance of #{MAX_BALANCE}" if max_balance?(money)
    @balance += money
  end

 private
  def max_balance?(money)
    @balance + money > MAX_BALANCE
  end
end