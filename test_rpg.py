#!/usr/bin/python
# -*- encoding: utf-8 -*-
import unittest
import antlr3
import random
from RPGLexer import RPGLexer
from RPGParser import RPGParser
wciecie=' '*5
import StringIO

def plik_ciag_znakow(s):
        output = StringIO.StringIO()
        output.write(s)
        output.seek(0)
        return output

def normalizator_wiki(w):
        wynik=[]
        f=plik_ciag_znakow(w.text)
        o=codecs.getreader('utf-8')(f)
        l=TDDczysciciel.Lexer(o)


def parserek(znaki):
	char_stream = antlr3.ANTLRStringStream(znaki)
	lexer = RPGLexer(char_stream)
	tokens = antlr3.CommonTokenStream(lexer)
	parser = RPGParser(tokens)
	return parser


class test_rpg(unittest.TestCase):
	def setUp(self):
		pass

	def test_test(self):
		self.assertTrue(True)

	def test_wciecie(self):
		s=wciecie
		parser=parserek(s)
		wynik=parser.wciecie()
		self.assertTrue(wynik)
		
	def test_komentarz_k(self):
		s=' *'
		parser=parserek(s)
		wynik=parser.komentarz_k()
		self.assertTrue(wynik)
		
	def test_komentarz_opis(self):
		s=' komentarz'
		parser=parserek(s)
		wynik=parser.komentarz_opis()
		self.assertTrue(wynik)
		
	def test_komentarz_opis2(self):
		s=' Historically RPG is columnar in nature, though free-formatting'
		parser=parserek(s)
		wynik=parser.komentarz_opis()
		self.assertTrue(wynik)
		
	def test_komentarz(self):
		s=wciecie+' * Historically RPG is columnar in nature, though free-formatting'
		parser=parserek(s)
		wynik=parser.komentarz()
		self.assertTrue(wynik)
		
	def test_free_k(self):
		s=' /FREE'
		parser=parserek(s)
		wynik=parser.free_k()
		self.assertTrue(wynik)
		
	def test_end_free_k(self):
		s=' /END-FREE'
		parser=parserek(s)
		wynik=parser.end_free_k()
		self.assertTrue(wynik)

	def test_free(self):
		s=wciecie+' /FREE'
		parser=parserek(s)
		wynik=parser.deklaracja_free()
		self.assertTrue(wynik)
		
	def test_end_free(self):
		s=wciecie+' /END-FREE'
		parser=parserek(s)
		wynik=parser.deklaracja_end_free()
		self.assertTrue(wynik)

	def test_deklaracji_k(self):
		s='D '
		parser=parserek(s)
		wynik=parser.deklaracja_k()
		self.assertTrue(wynik)

	def test_deklaracji_funkcji(self):
		s='     D Switch          PI'
		parser=parserek(s)
		wynik=parser.deklaracja_funkcji()

if __name__ == '__main__':
	unittest.main()

