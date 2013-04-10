all: RPGParser.py RPGLexer.py

RPGParser.py: RPGLexer.py

RPGLexer.py: RPG.g
	antlr3 RPG.g

clean:
	rm -f RPGParser.py RPGLexer.py
