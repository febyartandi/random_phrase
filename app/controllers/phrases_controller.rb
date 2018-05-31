class PhrasesController < ApplicationController
  
  def index
    @random_phrase = RandomPhraseService.new(session[:user_key])
  end
  
  def random
    @random_phrase = RandomPhraseService.new(session[:user_key])
    @random_phrase.perform
    render :index
  end
  
  def clear
    @random_phrase = RandomPhraseService.new(session[:user_key])
    @random_phrase.clear
    redirect_to root_path
  end
  
end
