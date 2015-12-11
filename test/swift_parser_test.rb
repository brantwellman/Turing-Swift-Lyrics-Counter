require 'minitest'
require 'minitest/autorun'
require_relative '../lib/swift_parser'

class SwiftParserTest < Minitest::Test

  def test_swift_parser_exits
    assert SwiftParser
  end

  def test_can_readlines_from_one_line_file
    parser = SwiftParser.new("test/fixture.txt")
    expected = "He said the way my blue eyes shined"
    assert_equal expected, parser.lyrics
  end

  def test_can_readlines_from_two_line_file
    parser = SwiftParser.new("test/fixture2.txt")
    expected ="He said the way my blue eyes shined Put those Georgia stars to shame that night"
    assert_equal expected, parser.lyrics
  end

  def test_can_eliminate_punctuation_from_lyrics
    parser = SwiftParser.new("test/fixture3.txt")
    expected = "I said That's a lie"
    assert_equal expected, parser.lyrics
  end

  def test_will_return_number_of_unique_words
    parser = SwiftParser.new("test/fixture.txt")
    expected = 8
    assert_equal expected, parser.count_words
  end

  def test_will_return_number_of_unique_words_with_duplicate_words
    parser = SwiftParser.new("test/fixture4.txt")
    expected = 8
    assert_equal expected, parser.count_words
  end

  def test_will_return_number_of_unique_words_with_duplicate_words
    parser = SwiftParser.new("test/fixture5.txt")
    expected = 1
    assert_equal expected, parser.count_words
  end
end
