class PagesController < ApplicationController
  HITS = %w[90s disney eurovision indie triunfo pop].freeze
  LETTERS = %w[A B C D E F G H I J K L M N ñ O P Q R S T U V W X Y Z 0].freeze
  BEST = ['best'].freeze

  def home; end

  def alphabet
    @letters = LETTERS
  end

  def hits
    @hits = HITS
  end

  def best
    @best = BEST
  end
end
