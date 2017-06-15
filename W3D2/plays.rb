require 'sqlite3'
require 'singleton'

class PLayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super ('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end

class Play
  def self.all
    data = PLayDBConnection.istance.execute("SELECT * FROM plays")
    data.map {|datum| Play.new(datum) }
  end

  def initialize (options)
    @id = options['id']
    @title = options['title']
    @year = 
  end
end
