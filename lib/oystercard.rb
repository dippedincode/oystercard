class Oystercard
  attr_reader :balance

  def initialize
    @balance = 3
  end

  def top_up(amount)
    raise "Cannot Top-up: Balance cannot exceed 90" unless within_limit? amount
    @balance += amount
  end

  def deduct
  end
  
  private

  def within_limit?(amount)
    @balance + amount <= 90
  end
end