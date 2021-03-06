class Bank

  attr_reader :name, :transactions

  def initialize(name)
    @name = name
    @transactions = []
    add_transaction("Beginning Balance", 0)
  end

  def credit(amount)
    add_transaction(Time.now, amount)
  end

  def debit(amount)
    add_transaction(Time.now, -amount)
  end

  def add_transaction(amount)
    @transactions.push(date: Time.now, amount: amount)
  end

  def balance
    balance = 0.0
    @transactions.each do |transaction|
      balance += transaction [:amount]
    end
  return balance
  end

  def print_balance
    puts "-" * 40

    puts "Date".ljust(20) + "Amount".center(20)
    @transactions.each do |transaction|
      puts transaction[:date].ljust(20) + sprintf("%0.2f", transaction[:amount]).center(20)
    end
  end

end
