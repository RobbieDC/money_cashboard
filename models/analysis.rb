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

end