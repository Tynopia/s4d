*&---------------------------------------------------------------------*
*& Report z09_abap_07
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09_abap_07.

DATA booking_with_customer TYPE zabap_booking_with_customer.

PARAMETERS carr_id TYPE s_carr_id.
PARAMETERS conn_id TYPE s_conn_id.
PARAMETERS fl_date TYPE s_date.
PARAMETERS book_id TYPE s_book_id.

WRITE / |Fluggesellschaft: { booking_with_customer-carrier_id }|.
WRITE / |Verbindungsnummer: { booking_with_customer-connection_id }|.
WRITE / |Flugdatum: { booking_with_customer-flight_date }|.
WRITE / |Buchungsnummer: { booking_with_customer-booking_id }|.
WRITE / |Kundentyp: { booking_with_customer-customer_type }|.
WRITE / |Raucher: { booking_with_customer-is_smoker }|.
WRITE / |Kundennummer: { booking_with_customer-customer_id }|.
WRITE / |Name: { booking_with_customer-name }|.
WRITE / |Stdt: { booking_with_customer-city }|.
WRITE / |Land: { booking_with_customer-country }|.

AT SELECTION-SCREEN.
  TRY.
      booking_with_customer = zcl_09_helper=>get_booking_with_customer(
                                carrier_id    = carr_id
                                connection_id = conn_id
                                flight_date   = fl_date
                                booking_id    = book_id
                              ).
    CATCH zcx_no_booking_found INTO DATA(booking_exception).
      MESSAGE e000(z09_booking) WITH carr_id conn_id fl_date book_id.
    CATCH zcx_no_customer_found INTO DATA(customer_exception).
      MESSAGE e001(z09_booking) WITH booking_with_customer-customer_id.
  ENDTRY.






























  "nice :)
