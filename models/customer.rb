require_relative('../db/sql_runner')

class Customer

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO customers (name) VALUES ('#{@name}') RETURNING id"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customer = SqlRunner.run(sql)
    result = customer.map {|customer| Customer.new(customer)}
    return result
  end












end