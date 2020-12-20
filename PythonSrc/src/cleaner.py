import string
#from gensim import corpora

#import nltk

# # nltk.download('stopwords')
# nltk.download('wordnet')

class Cleaner:

  def __init__(self):
    # Punctuations and stopwords
    self.punctuation = set(string.punctuation)
    #self.stoplist = set(stopwords.words('english'))

    # LDA
    # self.dictionary = corpora.Dictionary()
    #self.lemma = WordNetLemmatizer()


  def remove_punctuation(self, text):
      return ''


  def remove_numbers(self, text):
      char_to_remove = [',','.','/','(',')','[',']']
      sc = set(char_to_remove)
      text = text.lower()
      return ''.join([c for c in text if c not in sc])

  def remove_stopwords(self, text, stopwords ):
      return " ".join([word for word in text.split() if word not in stopwords])


  def remove_single_chars(self, text):
      return text


  def lemmatize(self, text):
      return text


  def clean_text(self, text, stopwords):
      #text = self.remove_stopwords(text, stopwords)
      text = self.remove_numbers(text)
      text = self.remove_single_chars(text)
      return text