

module FBayesDir
  def self.root
    #Gem::Specification.find_by_name("fBayes").gem_dir + "/lib/data/"
    Dir.pwd  + "/lib/data/"
  end

  def self.cdc_data
    self.root + "/cdc/data/"
  end

  def self.sr24_data
    self.root + "/sr24/data/"
  end

  def self.internal_turnk_data
    self.root + "/internalTurnk/data/"
  end
end


require_relative './data/cdc/classifier'
require_relative './data/internalTurnk/classifier'
require_relative './data/sr24/classifier'

puts "*" * 100

puts "Clasifier Object: @sr24_classifier"
puts "Classifier Object: @cdc_classifier"
puts "Classifier Object: @it_classifier"

require_relative './global_classifier'
