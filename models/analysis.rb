class Analysis

  attr_reader( :merchants, :tags, :transactions )

  def initialize( options )
    @merchants = options["merchants"]
    @tags = options["tags"]
    @transactions = options["transactions"]
  end

end