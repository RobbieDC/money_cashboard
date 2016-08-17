class Budget

  attr_reader( :weekly_budget, :week_number )

  def initialize( options )
    @weekly_budget = options["weekly_budget"].to_i
    @week_number = options["week_number"].to_i
  end

end