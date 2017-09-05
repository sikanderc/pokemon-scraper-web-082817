class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(x)
    @id = x[:id]
    @name = x[:name]
    @type = x[:type]
    @db = x[:db]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_input, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id_input).first
    pokemon_object = Pokemon.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2])
    pokemon_object
  end

end
