# frozen_string_literal: true

module Amatch
  class Map
    attr_reader :patterns, :algorithm

    def initialize(algo_class)
      @patterns = {}
      @algorithm = "Amatch::#{algo_class.to_s.camelize}".constantize
    end

    def add(needle, reference)
      needle = normalize_string(needle)
      patterns[reference] = algorithm.new(needle)
    end

    def find(needle)
      needle = normalize_string(needle)
      finds = []
      patterns.each do |key, pattern|
        finds << [pattern.match(needle), key]
      end
      finds.sort_by { |(weight, _key)| weight }.reverse
    end

    def delete(key)
      patterns.delete(key)
      patterns
    end

    private

    def normalize_string(needle)
      result = needle.downcase
      unless result =~ /^([a-z ])+$/
        result = result.unicode_normalize(:nfd).gsub(/[^\x00-\x7F]/,'').to_s.gsub(/[^a-z]/,' ')
      end
      result.gsub(/\s+/,' ').strip
    end
  end
end