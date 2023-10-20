*&---------------------------------------------------------------------*
*& Report z09_demo_04
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09_demo_04.

DATA text TYPE string VALUE 'Hello'.
DATA text2 TYPE string VALUE 'World'.
DATA text3 TYPE string.

text3 = text && | | && text2.
WRITE text3.

text3 = |{ text } { text2 }|.
WRITE / text3.

WRITE / |Länge von text3: { strlen( text3 ) }|.
