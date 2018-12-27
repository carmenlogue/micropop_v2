class PagesController < ApplicationController
  HITS = %w[90s disney eurovision indie triunfo pop].freeze
  LETTERS = %w[A B C D E F G H I J K L M N ñ O P Q R S T U V W X Y Z 0].freeze
  BEST = 'best of'.freeze

  def home
    random_reference = Poem.pluck(:reference).sample
    @poem = Poem.find_by(reference: random_reference)

    render 'poems/show'
  end

  def alphabet
    @letters = LETTERS
  end

  def hits_list
    @hits = HITS
  end

  def best
    @poems = Poem.includes(:tags).where(tags: { name: BEST }).page(params[:page])

    render 'poems/index'
  end
end
