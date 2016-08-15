require( "pg" )
require_relative( "../db/sql_runner" )

class Tag

  attr_reader( :id, :type )

  def initialize( options )
    @id = options["id"].to_i
    @type = options["type"]
  end

  def save()
    sql = "INSERT INTO tags (type) VALUES ('#{@type}') RETURNING *;"
    new_tag = SqlRunner.run( sql ).first
    @id = new_tag["id"]
  end

  def self.all()
    sql = "SELECT * FROM tags;"
    tags_data = SqlRunner.run( sql )
    tags = tags_data.map { |tag| Tag.new( tag ) }
    return tags
  end

  def self.delete_all()
    sql = "DELETE FROM tags;"
    SqlRunner.run( sql )
  end

end