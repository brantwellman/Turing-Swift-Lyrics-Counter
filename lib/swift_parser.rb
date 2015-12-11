require 'pry'

class SwiftParser
  attr_reader :lyrics

  def initialize(file)
    @file = File.new(file, "r")
    @lyrics = @file.read.chomp
    sanitize
  end

  def sanitize
    @lyrics = lyrics.gsub(/\n/, " ")
    @lyrics = lyrics.gsub(/[\"\.\?\:\,]/, "")
  end

  def count_words
    @lyrics.downcase.split.uniq.count
  end
end

# 2118
