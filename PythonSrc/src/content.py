from flask import Flask, jsonify, request
import pymysql
from src.cleaner import Cleaner
from flaskext.mysql import MySQL

class Content:

    def __init__(self, conn, mysql, stopwords):
        # self.categories = []
        # self.conn = sqlite3.connect(db_file)
        self.stopwords = stopwords
        conn = mysql.connect()
        self.conn = conn
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        # cursor.execute("SELECT * FROM post")

        self.cursor = cursor
        self.cleaner = Cleaner()

    def get_ids(self):
        self.cursor.execute('SELECT Id FROM post')
        #results = c.fetchall()

        return [Id for Id in self.cursor.fetchall()]

    def getId(n):
        return n.Id

    def get_page_by_id(self, Slug):

        self.cursor.execute("SELECT Summary FROM post WHERE Id = %s ", Slug)
        rs = self.cursor.fetchone()


        return str(rs['Summary'])

    def get_url_by_id(self, id):
        self.cursor.execute("SELECT Slug, Title FROM post WHERE Id = %s ", id['Id'])
        rs = self.cursor.fetchone()
        return rs


    def __iter__(self):
        rs = [];

        for Slug in self.get_ids():

            page = self.get_page_by_id(Slug['Id'])
            #print(self.cleaner.clean_text(page).split())
            print(self.cleaner.clean_text(page, self.stopwords).split())
            yield self.cleaner.clean_text(page, self.stopwords).split()