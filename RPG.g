grammar RPG;
options { language=Python; backtrack=true; }
@header { }

program:		(
			(	komentarz 
			| 	deklaracja_funkcji
			| 	deklaracja_free
			| 	deklaracja_end_free
			) NL )+ ;

deklaracja_funkcji returns [w]:		wciecie	DEKLARACJA_K p=NAZWA PI {w=p};
deklaracja_free returns [w]:		wciecie	p=FREE_K {w=p};
deklaracja_end_free returns [w]:	wciecie	p=END_FREE_K {w=p}; 
komentarz returns [w]:			wciecie KOMENTARZ_K p=KOMENTARZ {w=p};
komentarz_k returns [w]:		p=KOMENTARZ_K {w=p};
deklaracja_k returns [w]:		p=DEKLARACJA_K {w=p};
end_free_k returns [w]:			p=END_FREE_K {w=p};
free_k returns [w]:			p=FREE_K {w=p};
komentarz_opis returns [w]:		p=KOMENTARZ {w=p};
wciecie returns [w]:			p=WCIECIE  {w=p};


ABS_SK:				'%ABS';
ADDR_SK:			'%ADDR';
ALLOC_SK:			'%ALLOC';
CHAR_SK:			'%CHAR';
CHECK_SK:			'%CHECK';
CHECKR_SK:			'%CHECKR';
DATE_SK:			'%DATE';
DAYS_SK:			'%DAYS';
DEC_SK:				'%DEC';
DECH_SK:			'%DECH';
DECPOS_SK:			'%DECPOS';
DIFF_SK:			'%DIFF';
DIV_SK:				'%DIV';
EDITC_SK:			'%EDITC';
EDITFLT_SK:			'%EDITFLT';
EDITW_SK:			'%EDITW';
ELEM_SK:			'%ELEM';
EOF_SK:				'%EOF';
EQUAL_SK:			'%EQUAL';
ERROR_SK:			'%ERROR';
FLOAT_SK:			'%FLOAT';
FOUND_SK:			'%FOUND';
GRAPH_SK:			'%GRAPH';
HOURS_SK:			'%HOURS';
INT_SK:				'%INT';
INTH_SK:			'%INTH';
LEN_SK:				'%LEN';
LOOKUPxx_SK:			'%LOOKUPxx';
MINUTES_SK:			'%MINUTES';
MONTHS_SK:			'%MONTHS';
MSECONDS_SK:			'%MSECONDS';
NULLIND_SK:			'%NULLIND';
OCCUR_SK:			'%OCCUR';
OPEN_SK:			'%OPEN';
PADDR_SK:			'%PADDR';
PARMS_SK:			'%PARMS';
REALLOC_SK:			'%REALLOC';
REM_SK:				'%REM';
REPLACE_SK:			'%REPLACE';
SCAN_SK:			'%SCAN';
SECONDS_SK:			'%SECONDS';
SHTDN_SK:			'%SHTDN';
SIZE_SK:			'%SIZE';
SQRT_SK:			'%SQRT';
STATUS_SK:			'%STATUS';
STR_SK:				'%STR';
SUBDT_SK:			'%SUBDT';
SUBST_SK:			'%SUBST';
THIS_SK:			'%THIS';
TIME_SK:			'%TIME';
TIMESTAMP_SK:			'%TIMESTAMP';
TLOOKUPxx_SK:			'%TLOOKUPxx';
TRIM_SK:			'%TRIM';
TRIML_SK:			'%TRIML';
TRIMR_SK:			'%TRIMR';
UCS2_SK:			'%UCS2';
UNS_SK:				'%UNS';
UNSH_SK:			'%UNSH';
XFOOT_SK:			'%XFOOT';
XLATE_SK:			'%XLATE';
YEARS_SK:			'%YEARS';

WCIECIE_LUB_KOMENTARZ
		: {self.getCharPositionInLine()==0}? ( WCIECIE ) => WCIECIE { $type=WCIECIE; }
		| ( DEKLARACJA_K ) => DEKLARACJA_K { $type=DEKLARACJA_K; }
		| ( FREE_K ) => FREE_K { $type=FREE_K; }
		| ( END_FREE_K ) => END_FREE_K { $type=END_FREE_K; }
		| {self.getCharPositionInLine()==23}? ( PI ) => PI { $type=PI; }
		| {self.getCharPositionInLine()==7}? ( NAZWA ) => NAZWA { $type=NAZWA; }
		| ( KOMENTARZ ) => KOMENTARZ { $type=KOMENTARZ; }
		;

fragment
WCIECIE:			{self.getCharPositionInLine()==0}? '     ';

KOMENTARZ_K:			' *';
fragment
DEKLARACJA_K:			'D ';
fragment
PI:				'PI';
fragment 
FREE_K:				' /FREE';
fragment 
END_FREE_K:			' /END-FREE';
fragment
MALA_LITERA:			'a'..'z' ; 
fragment
KOMENTARZ:			(MALA_LITERA|SPACJA|CYFRA|DUZA_LITERA|ZNAK_SPECJALNY)+;

fragment
NAZWA:				{self.getCharPositionInLine()==7}? (MALA_LITERA|CYFRA|DUZA_LITERA)+ ' '* ;
fragment
DUZA_LITERA:			'A'..'Z' ;
fragment
CYFRA:				'0'..'9' ;		
fragment
ZNAK_SPECJALNY:			'+' | '-' | ',' | '.' | '&' | '/' | '$ '| '#' | '\'' | ':' | '@' | '_' | '>' | '<' | '=' | '(' | ')' | '%' ;
fragment
SPACJA:				' ';

NL:				'\n';


