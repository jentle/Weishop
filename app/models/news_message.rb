class NewsMessage < Message
  has_many :article_items
  
  def to_str
    "This is a news message"
  end
end