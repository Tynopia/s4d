*&---------------------------------------------------------------------*
*& Report z09_demo_09
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09_demo_09.

TRY.
    DATA(result) = zcl_09_calculator=>divide(
                     value1 = 3
                     value2 = 2
                   ).
  CATCH cx_sy_zerodivide INTO DATA(exception).
    WRITE exception->get_text(  ).
ENDTRY.

WRITE result.
