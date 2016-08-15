require( "pg" )
require_relative( "../db/sql_runner" )
require_relative( "./merchant" )

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

  def merchants()
    sql = "SELECT m.* FROM merchants m 
      INNER JOIN transactions t ON t.merchant_id = t.id 
      WHERE t.tag_id = #{@id};"
    return Merchant.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM tags;"
    tags_data = SqlRunner.run( sql )
    tags = tags_data.map { |tag| Tag.new( tag ) }
    return tags
  end

  def self.find( id )
    sql = "SELECT * FROM tags WHERE id = #{id};"
    tag_data = SqlRunner.run( sql ).first
    tag = Tag.new( tag_data )
    return tag
  end

  def self.delete_all()
    sql = "DELETE FROM tags;"
    SqlRunner.run( sql )
  end

  def self.map_items( sql )
    tag_data = SqlRunner.run( sql )
    tags = tag_data.map { |tag| Tag.new( tag ) }
    return tags
  end

end