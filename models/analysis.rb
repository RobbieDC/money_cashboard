require( "Date" )

class Analysis

  attr_reader( :merchants, :tags, :transactions )

  def initialize( options )
    @merchants = options["merchants"]
    @tags = options["tags"]
    @transactions = options["transactions"]
  end

  def create_date_object(transaction_date)
    day = Date.parse(transaction_date).wday
    return day
  end

  def group_transactions_by_week()
    sorted_transactions = @transactions.sort { |a, b| a.date_conducted <=> b.date_conducted }

    week_counter = 1
    transactions_by_week = {}
    transactions_for_week = []
    transaction_day_integer_list = []
    for transaction in sorted_transactions

      transaction_date = transaction.date_conducted
      transaction_day = Date.parse(transaction_date).wday
      transaction_day_integer_list.push(transaction_day)
      if transaction_day == 0
        week_counter += 1
        transactions_for_week = []
        transactions_for_week.push(transaction)
        transactions_by_week[week_counter] = transactions_for_week
      else
        transactions_for_week.push(transaction)
        transactions_by_week[week_counter] = transactions_for_week
      end
    end
    return transaction_day_integer_list
    return transactions_by_week[2].count
  end

end