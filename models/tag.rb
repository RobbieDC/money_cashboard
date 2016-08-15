require( "pg" )
require_relative( "../db/sql_runner" )

class Tag

  attr_reader( :type )

  def initialize( options )
    @type = options["type"]
  end

end