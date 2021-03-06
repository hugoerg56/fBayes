require 'classifier'

puts "*" * 100
puts "SR24 CLASSIFIER:"
puts "*" * 100



class USDA
  attr_accessor :classifier

  def initialize
    @classifier = Classifier::Bayes.new 
    add_categories
    train
  end


  def add_categories
    categories_path =  Dir[ FBayesDir.sr24_data + "*"]
    @categories = categories_path.map{|path| path.gsub(FBayesDir.sr24_data, "")}

    @categories.each do |c|
      @classifier.add_category c
    end
  end

  def train 
    total_size = 0

    @categories.each do |category|
      method = "train_" + category.downcase
      data = File.read( FBayesDir.sr24_data + category.to_s)
      puts category +": " + data.size.to_s
      @classifier.send(method, data)
      total_size += data.size.to_i
    end

    puts "TOTAL SIZE: #{total_size}"
  end

  def c(word)
    @classifier.classify(word)
  end

  def d(word)
    @classifier.classifications(word)
  end
end
