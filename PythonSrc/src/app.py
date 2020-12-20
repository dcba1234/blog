from flask import Flask, jsonify, request
import pymysql
import os
import logging
import random
import numpy as np
from flask_cors import CORS, cross_origin
from flaskext.mysql import MySQL
from src.cleaner import Cleaner
from gensim import corpora, utils, models, similarities
from gensim.parsing.preprocessing import preprocess_string, strip_punctuation,strip_numeric
import joblib
from src.content import Content
import pickle
PATH_LDA_MODEL = "models/LDA.model"
CORPUS_PATH = "models/LDA.corpus"
DICTIONARY_PATH = "models/LDA.dictionary"
PATH_DOC_TOPIC_DIST = "models/doc_topic_dist.dat"
# Basic passes
NUM_PASSES = 10
NUM_TOPICS = 10
RANDOM_STATE = 1

app = Flask(__name__)
app.secret_key = os.environ.get("SECRET_KEY", "framgia123")
CORS(app)

stopwords = []
with open('./data/vni_stopwords.txt', encoding="utf8") as f:
    for line in f:
        stopwords.append(" ".join(line.strip().split()))  # _
    #print(stopwords)


# class method
def documents_topic_distribution(self):
    doc_topic_dist = np.array(
        [[tup[1] for tup in lst] for lst in self.lda_model[self.corpus]]
    )
    # save documents-topics matrix
    joblib.dump(doc_topic_dist, PATH_DOC_TOPIC_DIST)
    return doc_topic_dist



@app.route('/ping', methods=['GET'])
def ping_pong():
    return jsonify({
        'call': 'success',
        'message': 'pong!'
    })


@app.route('/get', methods=['GET'])
def get():
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT * FROM post")

        empRow = cursor.fetchall()
        respone = jsonify(empRow)
        respone.status_code = 200
        return respone
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()

@app.route('/test', methods=['GET'])
def test():
    try:
        conn = mysql.connect()
        content = Content(conn, mysql, stopwords)

        dictionary = corpora.Dictionary(content)
        #print(dictionary)
        #dictionary.filter_extremes(no_below=5, no_above=0.8)
        corpus = [dictionary.doc2bow(text) for text in content]
        #print(corpus)
        # LDA Model
        lda = models.LdaModel(corpus, id2word=dictionary, random_state=RANDOM_STATE,
                              num_topics=NUM_TOPICS, passes=NUM_PASSES)
        print('topic')
        lda_topics = lda.show_topics(num_words=5)

        topics = []
        filters = [lambda x: x.lower(), strip_punctuation, strip_numeric]

        for topic in lda_topics:
            print(topic)
            topics.append(preprocess_string(topic[1], filters))

        print(topics)

        # Save resources
        lda.save(PATH_LDA_MODEL)
        with open(DICTIONARY_PATH, 'wb') as fp:
            pickle.dump(dictionary, fp)
        fp.close()
        with open(CORPUS_PATH, 'wb') as fp:
            pickle.dump(corpus, fp)
        fp.close()
        return 'done ...'
    except Exception as e:
        print(e)
    finally:
        conn.close()


def get_similarity(lda, query_vector, corpus):
    index = similarities.MatrixSimilarity(lda[corpus])
    sims = index[query_vector]
    return sims


@app.route('/get-similar', methods=['GET'])
def testQuery():
    query = request.args.get('q')
    if(not query):
        return ''
    with open(DICTIONARY_PATH, 'rb') as fp:
        dictionary = pickle.load(fp)
        fp.close()
    with open(CORPUS_PATH, 'rb') as fp:
        corpus = pickle.load(fp)
        fp.close()
    lda = models.LdaModel.load(PATH_LDA_MODEL)
    cleaner = Cleaner()
    query = cleaner.clean_text(query, stopwords)
    words = dictionary.doc2bow(query.split())

    #print(words)
    # for word in words:
    #     print("{} {}".format(word[0], dictionary[word[0]]))
    query_vector = lda[words]
    sims = get_similarity(lda, query_vector, corpus)
    sims = sorted(enumerate(sims), key=lambda item: -item[1])
    idx = 0
    pids = []
    result = 5
    conn = mysql.connect()
    content = Content(conn, mysql, stopwords)
    page_ids = content.get_ids()
    print("\nCheck out the links below: q = " +  query)
    listRs = []
    while result > 0:
        pageid = page_ids[sims[idx][0]]
        if pageid not in pids:
            pids.append(pageid)
            r = content.get_url_by_id(pageid)
            print("{}".format(r))
            listRs.append(r)
            result -= 1
        idx += 1
    return jsonify(listRs)

if __name__ == "__main__":
    mysql = MySQL()
    app.config['MYSQL_DATABASE_USER'] = 'tienthanh217'
    app.config['MYSQL_DATABASE_PASSWORD'] = 'thanhthanh12'
    app.config['MYSQL_DATABASE_DB'] = 'blog'
    app.config['MYSQL_DATABASE_HOST'] = 'localhost'
    mysql.init_app(app)


    app.run(host='localhost', debug=True)

