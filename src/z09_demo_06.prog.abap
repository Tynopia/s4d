*&---------------------------------------------------------------------*
*& Report z09_demo_06
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09_demo_06.

WHILE sy-index <= 10.
  WRITE / sy-index.
ENDWHILE.

DO 10 TIMES.
  WRITE / sy-index.
ENDDO.

DO.

ENDDO.
