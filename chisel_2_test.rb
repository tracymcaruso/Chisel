require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'chisel'

class ChiselTest < Minitest::Test

  def test_it_exists
    assert Chisel
  end

  def test_parse_h1_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_h1)
  end

  def test_parser_changes_test_to_h1
    chisel = Chisel.new
    assert_equal "<h1>This is a line</h1>", chisel.parse_h1("#This is a line")
  end

  def test_parse_h2_exists
    chisel = Chisel.new

  end

  def test_parser_changes_test_to_h2
    chisel = Chisel.new
    assert_equal "<h2>This is a line</h2>", chisel.parse_h2("##This is a line")
  end

  def test_parse_h3_exisits
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_h3)
  end

  def test_parser_changes_test_to_h3
    chisel = Chisel.new
    assert_equal "<h3>This is a line</h3>", chisel.parse_h3("###This is a line")
  end

  def test_parse_h4_exisits
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_h4)
  end

  def test_parser_changes_test_to_h4
    chisel = Chisel.new
    assert_equal "<h4>This is a line</h4>", chisel.parse_h4("####This is a line")
  end

  def test_parse_h5_exisits
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_h5)
  end

  def test_parser_changes_test_to_h5
    chisel = Chisel.new
    assert_equal "<h5>This is a line</h5>", chisel.parse_h5("#####This is a line")
  end

  def test_parse_p_tag_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_p)
  end

  def test_parser_changes_test_to_p
    chisel = Chisel.new
    assert_equal "<p>test line</p>", chisel.parse_p("test line")
  end

  def test_break_line_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:break_line)
  end

  def test_breaks_lines_by_new_line_char
    chisel = Chisel.new
    assert_equal ["This is", " a line"], chisel.break_line("This is\n a line")
  end

  def test_breaks_lines_by_two_new_line_char
    chisel = Chisel.new
    assert_equal ["This is", " a line"], chisel.break_line("This is\n\n a line")
  end

  def test_breaks_lines_with_multiple_newlines
    chisel = Chisel.new
    assert_equal ["This is", "a line", "This is", "a new line"], chisel.break_line("This is\n\na line\n\nThis is\na new line")
  end

  def test_parser_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse)
  end

  def test_checks_for_five_hashes
    chisel = Chisel.new
    assert_equal "<h5>Test input</h5>", chisel.parse_headers("#####Test input")
  end

  def test_checks_for_four_hashes
    chisel = Chisel.new
    assert_equal "<h4>Test input</h4>", chisel.parse_headers("####Test input")
  end

  def test_checks_for_three_hashes
    chisel = Chisel.new
    assert_equal "<h3>Test input</h3>", chisel.parse_headers("###Test input")
  end

  def test_checks_for_two_hashes
    chisel = Chisel.new
    assert_equal "<h2>Test input</h2>", chisel.parse_headers("##Test input")
  end

  def test_checks_for_one_hashes
    chisel = Chisel.new
    assert_equal "<h1>Test input</h1>", chisel.parse_headers("#Test input")
  end

  def test_passes_through_each_line
    chisel = Chisel.new
    #no idea
  end

  def test_parse_strong_first_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_strong_first)
  end

  def test_converts_first_double_asterisk_to_strong_tag
    chisel = Chisel.new
    assert_equal "<strong>broken", chisel.parse_strong_first("**broken")
  end

  def test_parse_emphasis_first_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_emphasis_first)
  end

  def test_converts_first_single_asterisk_to_em_tag
    chisel = Chisel.new
    assert_equal "<em>Test", chisel.parse_emphasis_first("*Test")
  end

  def test_break_line_to_words_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:break_line_to_words)
  end

  def test_break_line_into_words
    chisel = Chisel.new
    assert_equal ["broken", "line", "broken", "line"], chisel.break_line_to_words(["broken line", "broken line"])
  end

  def test_parse_strong_last_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_strong_last)
  end

  def test_converts_last_single_asterisk_to_closing_strong_tag
    chisel = Chisel.new
    assert_equal "broken</strong>", chisel.parse_strong_last("broken**")
  end

  def test_parse_emphasis_last_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_emphasis_last)
  end

  def test_converts_last_single_asterisk_to_em_tag
    chisel = Chisel.new
    assert_equal "Test</em>", chisel.parse_emphasis_last("Test*")
  end

  def test_parse_asterisks_exists
    chisel = Chisel.new
    assert chisel.respond_to?(:parse_asterisks)
  end

  def test_parse_asterisks_converts_to_opening_strong_tag
    chisel = Chisel.new
    assert_equal "<strong>broken", chisel.parse_asterisks("**broken")
  end

  def test_parse_asterisks_converts_to_opening_em_tag
    chisel = Chisel.new
    assert_equal "<em>broken", chisel.parse_asterisks("*broken")
  end

  def test_parse_asterisks_converts_to_closing_strong_tag
    chisel = Chisel.new
    assert_equal "broken</strong>", chisel.parse_asterisks("broken**")
  end

  def test_parse_asterisks_converts_to_closing_em_tag
    chisel = Chisel.new
    assert_equal "broken</em>", chisel.parse_asterisks("broken*")
  end

end
