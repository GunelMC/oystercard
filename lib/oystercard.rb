 class OysterCard

  attr_reader :balance
    
  def initialize
    @balance = 0
  end

  def top_up(money)
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

end