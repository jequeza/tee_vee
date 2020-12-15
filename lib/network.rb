class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show_obj)
    @shows << show_obj
  end

  def main_characters
    important_characters = []
    @shows.each do |show|
      show.characters.each do |character|
        important_characters << character if
        ((character.salary > 500_000) && (character.name.upcase == character.name))
      end
    end
    important_characters
  end

  def actors_by_show
    show_actors = Hash.new(0)
    @shows.each do |show|
      show_actors[show] = show.actors
    end
    show_actors
  end

  def shows_by_actor
    actor_shows = Hash.new(0)
    @shows.each do |show|
      show.characters.each do |character|
        actor_shows[character.actor] = show
      end
    end
    actor_shows
  end
end