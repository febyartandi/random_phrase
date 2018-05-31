class RandomPhraseService
  
  attr_accessor :session_key, :phrases, :remaining_count
  
  #Initialize the service object
  def initialize(session_key)
    self.session_key = session_key
    self.phrases = []
    self.remaining_count = Phrase.count
  end
  
  # Find current phrases and next phrase
  def perform
    self.phrases = Phrase.where(id: SessionPhrase.where(session_key: session_key).pluck(:phrase_id))
    add_more_phrase
    self.remaining_count = un_displayed_phrases.count
  end
  
  # Add phrase that didnt show yet to user and flag it as displayed
  def add_more_phrase
    un_display_phrase = un_displayed_phrases.first 
    if un_display_phrase.present? 
      self.phrases << un_display_phrase
      SessionPhrase.create(phrase_id: un_display_phrase.id, session_key: session_key)
    end
  end
  
  # clear current displayed phrases
  def clear
    SessionPhrase.where(session_key: session_key).delete_all
  end
  
  def un_displayed_phrases
    displayed_phrase_ids = SessionPhrase.where(session_key: session_key).pluck(:phrase_id)
    Phrase.where.not(id: displayed_phrase_ids)
  end
  
end