*&---------------------------------------------------------------------*
*& Report z09_abap_objects_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09_abap_objects_02.

DATA airplane TYPE REF TO zcl_09_airplane.
DATA airplanes TYPE TABLE OF REF TO zcl_09_airplane.

DATA(carrier) = NEW zcl_09_carrier( 'Lufthansa' ).

TRY.
    airplane = NEW zcl_09_cargo_plane( name = 'D-AIR' plane_type = 'A320' cargo_in_tons = 78 carrier = carrier ).
    APPEND airplane TO airplanes.

    airplane = NEW zcl_09_cargo_plane( name = 'D-LOL' plane_type = 'A320' cargo_in_tons = 90 carrier = carrier ).
    APPEND airplane TO airplanes.

    airplane = NEW zcl_09__passenger_plane( name = 'D-AIE' plane_type = 'A420' number_of_seats = 120 carrier = carrier ).
    APPEND airplane TO airplanes.
  CATCH zcx_09_initial_paramter  INTO DATA(exception).
    MESSAGE e000(z09_vehicle).
ENDTRY.

LOOP AT airplanes INTO airplane.
  WRITE / airplane->to_string(  ).
ENDLOOP.

WRITE / |Count: { zcl_09_airplane=>number_of_airplanes }|.
WRITE / |Carrier: { carrier->to_string(  ) }|.
