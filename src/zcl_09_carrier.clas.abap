CLASS zcl_09_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA name TYPE string READ-ONLY.
    DATA airplanes TYPE TABLE OF REF TO zcl_09_airplane.

    METHODS constructor
      IMPORTING name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO zcl_09_airplane.

    METHODS get_biggest_cargo_plane
      RETURNING VALUE(result) TYPE REF TO zcl_09_cargo_plane
      RAISING
                zcx_09_cargo_plane.

    METHODS to_string
      RETURNING VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_carrier IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    LOOP AT airplanes INTO DATA(airplane).
      IF airplane IS INSTANCE OF zcl_09_cargo_plane.
        DATA(cargo_plane) = CAST zcl_09_cargo_plane( airplane ).

        IF result IS INITIAL OR ( cargo_plane->cargo_in_tons > result->cargo_in_tons ).
          result = cargo_plane.
        ENDIF.
      ENDIF.
    ENDLOOP.

    IF result IS INITIAL.
      RAISE EXCEPTION TYPE zcx_09_cargo_plane.
    ENDIF.
  ENDMETHOD.

  METHOD to_string.
    result = name.
  ENDMETHOD.

ENDCLASS.
