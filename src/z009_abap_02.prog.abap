*&---------------------------------------------------------------------*
*& Report z009_abap_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z009_abap_02.

PARAMETERS p_id TYPE s_customer.
PARAMETERS p_name TYPE s_custname.
PARAMETERS p_city TYPE city.
PARAMETERS p_cntry TYPE s_country.

DATA(location) = |{ p_city } ({ p_cntry })|.

SHIFT p_id LEFT DELETING LEADING '0'.

CONCATENATE p_id p_name location INTO DATA(output) SEPARATED BY ', '.

WRITE output.
