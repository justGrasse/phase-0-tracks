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