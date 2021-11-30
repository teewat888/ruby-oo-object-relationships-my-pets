class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def species
    @species = "human"
  end
  
  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|c| c.owner == self}
  end

  def dogs
    Dog.all.select {|d| d.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name,self)
  end

  def buy_dog(name)
    dog = Dog.new(name,self)
  end

  def walk_dogs
    Dog.all.map do |dog|
      if dog.owner == self
        dog.mood = "happy"
      end
    end
  end

  def feed_cats
    Cat.all.map {|cat| cat.owner == self ? cat.mood = "happy" : cat.mood = "nervous"}
  end

  def sell_pets
    Cat.all.map do |cat|
      if cat.owner == self
        cat.mood = "nervous"
        cat.owner = nil
      end
    end

    Dog.all.map do |dog|
      if dog.owner == self
        dog.mood = "nervous"
        dog.owner = nil
      end
    end
  end

  def list_pets
    cats = Cat.all.select {|cat| cat.owner == self}.count
    dogs = Dog.all.select {|dog| dog.owner == self}.count
    "I have #{dogs} dog(s), and #{cats} cat(s)."
  end

end