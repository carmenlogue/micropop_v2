module PoemsHelper
  def tweet(poem)
    "http://twitter.com/intent/tweet?text=#{tweet_text(poem)}"
  end

  def url_for_facebook(poem)
    "http://www.micropop.es/poems/#{poem.reference}"
  end

  private

  def tweet_text(poem)
    [text_before_image, image_for_twitter(poem), text_after_image].join("\n")
  end

  def text_before_image
    'He encontrado esta canción hecha poema: '
  end

  def text_after_image
    ' Descubre más en @microPOP_ %23micropop'
  end

  def image_for_twitter(poem)
    "http://www.micropop.es/poems/#{poem.reference}"
  end
end
