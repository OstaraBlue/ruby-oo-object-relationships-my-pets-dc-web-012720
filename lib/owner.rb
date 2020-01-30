# require_relative "./cat.rb"
require 'pry'


class Owner
  # code goes here
  attr_reader :species, :name

  @@all = []
  @@count = 0



  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
    @@count += 1
  end

  #
  # instance methods
  #

  # def name
  #   @name
  # end

  def say_species
    return "I am a #{@species}."
  end

  def cats
    # call Cat class and get ".all method"
    Cat.all.select do |cat|
      if cat.owner == self
        cat
      end
    end
  end

  def dogs
    # call Dog class and get ".all method"
  
    array = Dog.all.select do |dog|
      if dog.owner == self
        dog
      end
    end
  end

  def buy_cat(cat_name)
    Cat.all.find do |cat|
      Cat.new(cat_name, self)
    end
  end

  def buy_dog(dog_name)
    Dog.all.find do |dog|
      Dog.new(dog_name, self)

    end
  end

  #
  # class methods
  #

  def self.all
    @@all
  end

  def self.count
   @@count 
  end

  def self.reset_all
    @@all.clear
    @@count = 0 
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
  
    def list_pets

    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
  end
end