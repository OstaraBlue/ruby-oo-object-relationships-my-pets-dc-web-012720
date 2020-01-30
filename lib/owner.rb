# require_relative "./cat.rb"
require 'pry'


class Owner
  # code goes here
  attr_reader :species, :name

  @@all = []
  @@count = 0



  def initialize(name="Unknown")
    @name = name
    @species = "human"

    @@all << self
    @@count += 1
  end

  #
  # instance methods
  #


  def say_species
    return "I am a #{@species}."
  end

  def cats
    # call Cat class and get ".all method" from cat.rb
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    # call Dog class and get ".all method"
  
    array = Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  
    def list_pets
      return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end

  #
  # class methods --> calls on ALL instances of a class
  #

  def self.all
    @@all
  end

  def self.count
   @@count 
   # or self.all.count
  end

  def self.reset_all
    @@all.clear
    @@count = 0 
  end

end