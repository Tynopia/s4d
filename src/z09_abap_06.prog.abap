*&---------------------------------------------------------------------*
*& Report z09_abap_06
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09_abap_06.

DATA customer TYPE z09_customer.

PARAMETERS c_id TYPE s_customer.

WRITE / |Name: { customer-name }|.
WRITE / |Stadt: { customer-city }|.
WRITE / |Land: { customer-country }|.

AT SELECTION-SCREEN.
  TRY.
      customer = zcl_abap_helper=>get_customer(
                   customer_id  = c_id
                 ).
    CATCH zcx_no_customer_found INTO DATA(exception).
      MESSAGE e000(z09_customer) WITH c_id.
  ENDTRY.
