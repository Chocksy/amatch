# frozen_string_literal: true

# include the extension
require 'amatch_ext'
# include gem files
require 'amatch/version'
require 'amatch/string'
require 'amatch/map'

module Amatch
  DiceCoefficient = PairDistance
  DEFAULT_ALGORITHM = 'PairDistance'

  def self.reset(algorithm = DEFAULT_ALGORITHM)
    @map = Map.new(algorithm)
  end

  def self.map(algorithm = DEFAULT_ALGORITHM)
    @map ||= Map.new(algorithm)
  end
end