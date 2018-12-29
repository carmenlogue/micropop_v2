class ArtistsController < ApplicationController
  ACCENTED_VOWELS = { A: 'Á', E: 'É', I: 'Í', O: 'Ó', U: 'Ú' }.freeze

  def index
    @artists = if params[:letter].match?(/[AEIOU]/)
                 artists_starting_with_vowel(params[:letter])
               elsif params[:letter] == '0' # number or symbol
                 artists_not_starting_with_letter
               elsif params[:letter]
                 artists_starting_with_consonant(params[:letter])
               else
                 Artist.page(params[:page])
               end
  end

  def scoped_index
    poems = poem_results(artist_id: params[:artist_id])
    paginate_search_results(poems)
  end

  private

  def artists_starting_with_vowel(vowel)
    Artist.where('substr(name, 1, 1) ~* ? OR substr(name, 1, 1) ~* ?',
                 vowel, ACCENTED_VOWELS[vowel.to_sym]) # case insensitive
  end

  def artists_starting_with_consonant(consonant)
    Artist.where('substr(name, 1, 1) ~* ?', consonant) # case insensitive
  end

  def artists_not_starting_with_letter
    Artist.where('substr(name, 1, 1) ~ ?', '[^a-zA-ZÁÉÍÓÚ]')
  end
end
