grammar RPG;
options { language=Python; backtrack=true; }
@header { }

program:		(
			(	komentarz 
			| 	deklaracja_free
			| 	deklaracja_end_free
			) NL )+ ;

deklaracja_free returns [w]:		wciecie	p=FREE_K {w=p};
deklaracja_end_free returns [w]:	wciecie	p=END_FREE_K {w=p}; 
komentarz returns [w]:			wciecie KOMENTARZ_K p=KOMENTARZ {w=p};
komentarz_k returns [w]:		p=KOMENTARZ_K {w=p};
end_free_k returns [w]:			p=END_FREE_K {w=p};
free_k returns [w]:			p=FREE_K {w=p};
komentarz_opis returns [w]:		p=KOMENTARZ {w=p};
wciecie returns [w]:			p=WCIECIE  {w=p};


WCIECIE_LUB_KOMENTARZ
		: {self.getCharPositionInLine()==0}? ( WCIECIE ) => WCIECIE { $type=WCIECIE; }
		| ( FREE_K ) => FREE_K { $type=FREE_K }
		| ( END_FREE_K ) => END_FREE_K { $type=END_FREE_K }
		| ( KOMENTARZ ) => KOMENTARZ { $type=KOMENTARZ; }
		;

fragment
WCIECIE:			{self.getCharPositionInLine()==0}? '     ';

KOMENTARZ_K:			' *';
fragment 
FREE_K:				' /FREE';
fragment 
END_FREE_K:			' /END-FREE';
fragment
MALA_LITERA:			'a'..'z' ; 
fragment
KOMENTARZ:			(MALA_LITERA|SPACJA|CYFRA|DUZA_LITERA|ZNAK_SPECJALNY)+;
fragment
DUZA_LITERA:			'A'..'Z' ;
fragment
CYFRA:				'0'..'9' ;		
fragment
ZNAK_SPECJALNY:			'+' | '-' | ',' | '.' | '&' | '/' | '$ '| '#' | '\'' | ':' | '@' | '_' | '>' | '<' | '=' | '(' | ')' | '%' ;
fragment
SPACJA:				' ';

NL:				'\n';
