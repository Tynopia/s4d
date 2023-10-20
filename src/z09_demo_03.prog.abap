*&---------------------------------------------------------------------*
*& Report z09_demo_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09_demo_03.

DATA result_i TYPE i.
DATA result_p TYPE p LENGTH 8 DECIMALS 4.

**********************************************************************
* Arithmetische Operatoren
**********************************************************************
result_i = 5 + 3. "Addition"
WRITE: / |5 + 3 = { result_i }|.

result_i = 5 - 3. "Substraktion"
WRITE: / |5 - 3 = { result_i }|.

result_i = 5 * 3. "Multiplikation"
WRITE: / |5 * 3 = { result_i }|.

result_p = 5 / 3. "Division"
WRITE: / |5 / 3 = { result_p }|.

result_i = 5 DIV 3. "Ganzzahlige Division"
WRITE: / |5 DIV 3 = { result_i }|.

result_i = 5 MOD 3. "Divisionsrest"
WRITE: / |5 MOD 3 = { result_i }|.

result_i = 5 ** 3. "Potenz"
WRITE: / |5 ** 3 = { result_i }|.

**********************************************************************
* Zuweisungsoperatoren
**********************************************************************
result_i = result_i + 1.
result_i += 1.
ADD 1 TO result_i.

WRITE: / |3 fache Inkrementierung: { result_i }|.

**********************************************************************
* Numerische Funktionen
**********************************************************************
result_i = abs( -5 ).
WRITE: / |abs( -5 ) = { result_i }|.

DATA(result_x) = round( val = '873.9767' dec = 2 ).
WRITE: / |round( val = '873.9767' dec = 2 ) = { result_x }|.
