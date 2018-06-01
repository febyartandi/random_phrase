class PhrasesController < ApplicationController
  
  def index
    @random_phrase = RandomPhraseService.new(session[:user_key])
    @random_phrase.find_current_phrases
  end
  
  def random
    @random_phrase = RandomPhraseService.new(session[:user_key])
    @random_phrase.perform_random
  end
  
  def clear
    @random_phrase = RandomPhraseService.new(session[:user_key])
    @random_phrase.clear
  end
  
end
