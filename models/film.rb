require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_writer :title
  
  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}',#{@price}) RETURNING id"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ('#{@title}', #{@price}) WHERE id = #{@id}"
    result =  SqlRunner.run(sql)
    return result
  end

  def customers()
    sql = "SELECT customers.* 
    FROM customers 
    INNER JOIN tickets 
    ON tickets.customer_id = customers.id 
    WHERE tickets.film_id = #{@id};"
    return Customer.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM films"
    return Film.map_items(sql)
  end

  def self.delete_all() 
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new( film ) }
    return result      
  end

end