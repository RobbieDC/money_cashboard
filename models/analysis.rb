require( "Date" )

class Analysis

  attr_reader( :merchants, :tags, :transactions )

  def initialize( options )
    @merchants = options["merchants"]
    @tags = options["tags"]
    @transactions = options["transactions"]
  end

  def group_transactions_by_week()
    transactions_by_week = {}
    transaction_array = []
    for transaction in @transactions
      week = Date.parse( transaction.date_conducted() ).cweek
      transaction_array = [] if !(transactions_by_week[week])
      transactions_by_week[week] = transaction_array.push( transaction )
    end
    return transactions_by_week
  end

  def total_spent_per_week(week)
    transactions_by_week = group_transactions_by_week()
    week_of_transactions = transactions_by_week[week]
    total_spent = 0
    for transaction in week_of_transactions
      value = transaction.value()
      total_spent += value
    end
    return total_spent
  end

end