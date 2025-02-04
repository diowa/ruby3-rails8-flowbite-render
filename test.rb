#!/usr/bin/env ruby
require 'minitest/autorun'

class TestRegexps < Minitest::Test
  # Regex for lines that come from an npm URL/path.
  NPM_REGEX = /^pin .*?(?<=npm:|npm\/|skypack\.dev\/|unpkg\.com\/)((?:@[^\/]+\/)?[^\/]+)(?=@\d+\.\d+\.\d+)@(\d+\.\d+\.\d+(?:[^\/\s["']*)).*$/

  # Regex for lines that come from a file path (inside quotes)
  FILE_PATH_REGEX = /^pin ["'](((?:@[^\/]+\/)?[^\/]+))(?=\/)["'].* #.*@(\d+\.\d+\.\d+(?:[^\s]*)).*$/

  ##
  # Tests for the NPM_REGEX.
  #
  def test_npm_scoped_package
    # Example: a scoped package from an npm-like URL.
    input = 'pin some prefix npm:@fortawesome/fontawesome-free@6.0.0 extra text'
    result = input.scan(NPM_REGEX)
    assert_equal 1, result.size, "Should have one match"
    package, version = result.first
    assert_equal '@fortawesome/fontawesome-free', package, "Scoped package name should be captured correctly"
    assert_equal '6.0.0', version, "Version should be captured correctly"
  end

  def test_npm_unscoped_package
    # Example: an unscoped package from an npm-like URL.
    input = 'pin irrelevant text npm:tailwindcss@3.1.8 some extra info'
    result = input.scan(NPM_REGEX)
    assert_equal 1, result.size, "Should have one match"
    package, version = result.first
    assert_equal 'tailwindcss', package, "Unscoped package name should be captured correctly"
    assert_equal '3.1.8', version, "Version should be captured correctly"
  end

  def test_npm_with_alternative_marker
    # Test with a different marker (e.g. unpkg.com) from which the package is extracted.
    input = 'pin blah unpkg.com/@babel/core@7.20.0 extra'
    result = input.scan(NPM_REGEX)
    assert_equal 1, result.size, "Should have one match"
    package, version = result.first
    assert_equal '@babel/core', package, "Scoped package name from unpkg.com should be captured correctly"
    assert_equal '7.20.0', version, "Version should be captured correctly"
  end

  ##
  # Tests for the FILE_PATH_REGEX.
  #
  def test_file_path_scoped_package
    # Example: a scoped package from a file path.
    input = 'pin "@fortawesome/fontawesome-free/svgs/brands/github.svg" # comment @6.0.0'
    result = input.scan(FILE_PATH_REGEX)
    assert_equal 1, result.size, "Should have one match"
    package, version = result.first
    assert_equal '@fortawesome/fontawesome-free', package, "Scoped package name should be captured correctly from file path"
    assert_equal '6.0.0', version, "Version should be captured correctly from file path"
  end

  def test_file_path_unscoped_package
    # Example: an unscoped package from a file path.
    input = 'pin "highlight.js/lib/index.js" # some comment @10.7.2'
    result = input.scan(FILE_PATH_REGEX)
    assert_equal 1, result.size, "Should have one match"
    package, version = result.first
    assert_equal 'highlight.js', package, "Unscoped package name should be captured correctly from file path"
    assert_equal '10.7.2', version, "Version should be captured correctly from file path"
  end
end
