# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# It includes code from the file 'state_data.rb' 
#   navigated from the active directory (<-- the relative part)
# require navigates from prescriptive paths set by ruby/user
require_relative 'state_data'

class VirusPredictor

  # Initializes the instance of class VirusPredictor
  #   'gets' some info, yo (state, pop, pop_d)

  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # Calls two other instance methods
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  # Determines based on pop_d and pop, how many people gonna die
  # prints and returns string with horrifying prediction
  def predicted_deaths
    # predicted deaths is solely based on population density
    factor = rangeGrabber(@population_density,
      [200,150,100,50],
      [0.4,0.3,0.2,0.1,0.05])
    number_of_deaths = (@population * factor).floor
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end

  # Determines based on pop_d, how quickly in months people gonna die
  # prints and returns string with horrifying prediction (with speed)
  def speed_of_spread #in months
    speed = rangeGrabber(@population_density,
      [200,150,100,50],
      [0.5,1,1.5,2,2.5])
    puts " and will spread across the state in #{speed} months.\n\n"
  end

  def rangeGrabber(input, range, output)
    range.each_index do |i|
      return output[i] if input >= range[i]
    end
    output[-1]
  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state, pop_hash|
  state = VirusPredictor.new(state, 
    pop_hash[:population_density], 
    pop_hash[:population])
  state.virus_effects
end



# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


#=======================================================================
# Reflection Section

=begin

  UNO. Hash Syntaxes: There are TWO types of syntax used. (1) The implicit syntax using the hash rocket (key => value) in which the key could be any object and (2) the alternative syntax structured (symbol_key: value), in which ONLY symbols can be used as keys.  Here we wanted to have clean strings as keys for workability, so the the hash rockets were used.  Otherwise the symbol notation is more efficient.

  DOS. require_relative allows youto load a file relative to the directory of the source file, while require uses the current dirctory that you are running the file from.

  TRES. Using the .each method you could iterate through each key-value pair.  Alternatively you could use .each_index to iterate through with an index variable.

  CUATRO.  The use of instance variables, being passed into an instance method.  The instance variables scope is the entire class, so there is no need to pass variables into a method that it can already access, CDC!  

  CINCO. I learned "git stash" and "git stash pop".  This was a pretty important discovery!  Also practice with iterations.  Especially after spending a week swimming in JavaScript it was good to go back and remember best practices in Ruby.  It was good practice in being comfortable bouncing between languages.

=end