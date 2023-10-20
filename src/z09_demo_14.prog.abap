*&---------------------------------------------------------------------*
*& Report z09_demo_14
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09_demo_14.

DATA connection TYPE spfli. "Struktur
DATA connections TYPE TABLE OF spfli. "Interne Tabelle

DATA carrier_id TYPE s_carr_id VALUE 'LH'.
DATA connection_id TYPE s_conn_id VALUE '0400'.

**********************************************************************
* Lesen eines Einzelsatzes
**********************************************************************
SELECT SINGLE FROM spfli
    FIELDS *
    WHERE carrid = @carrier_id AND connid = @connection_id
    INTO @connection.

IF sy-subrc <> 0.
  MESSAGE 'No Connection Found' TYPE 'E'.
ENDIF.

**********************************************************************
* Lesen mehrerer Datensätze
**********************************************************************
SELECT FROM spfli
    FIELDS *
    WHERE carrid = @carrier_id
    INTO TABLE @connections.

IF sy-subrc <> 0.
  MESSAGE 'No Connection Found' TYPE 'E'.
ENDIF.

*cl_salv_table=>factory(
*  EXPORTING
*    list_display   = if_salv_c_bool_sap=>false
*  IMPORTING
*    r_salv_table   = DATA(alv)
*  CHANGING
*    t_table        = connections
*).

*alv->display( ).

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_structure_name = 'SPFLI'
  TABLES
    t_outtab         = connections.
