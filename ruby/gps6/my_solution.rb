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
    if @population_density >= 200
      factor = 0.4
    elsif @population_density >= 150
      factor = 0.3
    elsif @population_density >= 100
      factor = 0.2
    elsif @population_density >= 50
      factor = 0.1
    else
      factor = 0.05
    end
      number_of_deaths = (@population * factor).floor

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # Determines based on pop_d, how quickly in months people gonna die
  # prints and returns string with horrifying prediction (with speed)
  def speed_of_spread #in months

    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

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