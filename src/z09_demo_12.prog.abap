*&---------------------------------------------------------------------*
*& Report z09_demo_12
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09_demo_12.

**********************************************************************
* Deklaration interner Tabellen
**********************************************************************
DATA connections TYPE z09_connections. "TYPE [Tabellentyp]"
DATA connections2 TYPE TABLE OF z09_connection. "TYPE TABLE OF [Strukturtyp]"

**********************************************************************
* Hinzufügen von Datensätzen
**********************************************************************
connections = VALUE #(
    (
        carrier_id = 'LH'
        connection_id = '0400'
    )
    (
        carrier_id = 'LH'
        departure_city = 'NEW YORK'
        connection_id = '0400'
    )
    (

    )
    (
        carrier_id = 'LH'
        arrival_city = 'FRANKFURT'
    )
 ).

connections = VALUE #( BASE connections (
    carrier_id = 'AA'
    connection_id = '0017'
    arrival_city = 'ROME'
 ) ).

DATA connection TYPE z09_connection.
connection-arrival_city = 'MADRID'.
connection-departure_city = 'BERLIN'.

APPEND VALUE #( connection_id = '0401' ) TO connections.
APPEND connection TO connections.

**********************************************************************
* Lesen von Datensätzen
**********************************************************************
"Lesen eines Einzelsatzes

IF line_exists( connections[ 1 ] ).
  connection = connections[ 1 ]. "Index
ENDIF.

TRY.
    connection = connections[ carrier_id = 'AA' connection_id = '0017' ]. "Komponenten
  CATCH cx_sy_itab_line_not_found.
ENDTRY.

" Lesen mehrerer Datensätze
LOOP AT connections INTO connection WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
  WRITE: / sy-tabix, connection.
ENDLOOP.

**********************************************************************
" Ändern eines Datensatzes
connections[ 1 ]-departure_city = 'FRANKFURT'. "Index
connections[ carrier_id = 'AA' connection_id = '0017' ]-departure_city = 'WALLDORF'.

" Ändern mehrerer Datensätze (Schlecht - Zwei Kopien)
LOOP AT connections INTO connection WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
  connection-carrier_id = 'LHD'.
  MODIFY connections FROM connection.
ENDLOOP.

" Ändern mehrerer Datensätze (Akzeptabel - Eine Kopie)
LOOP AT connections INTO connection WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
  connections[ sy-tabix ]-carrier_id = 'LHD'.
ENDLOOP.

DATA connection_r TYPE REF TO z09_connection.

" Ändern mehrerer Datensätze (Gut - Referenzen)
LOOP AT connections REFERENCE INTO connection_r WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
  connection_r->carrier_id = 'LHD'.
ENDLOOP.

**********************************************************************
* Sortieren
**********************************************************************
SORT connections BY carrier_id DESCENDING connection_id ASCENDING departure_city DESCENDING.

**********************************************************************
* Löschen
**********************************************************************
" Löschen eines Einzelsatzes
DELETE connections INDEX 4.
DELETE connections FROM connection.

" Löschen mehrerer Datensätze
DELETE connections WHERE arrival_city IS INITIAL.

**********************************************************************
* Größe
**********************************************************************
WRITE / lines( connections ).
