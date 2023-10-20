CLASS zcl_09_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_009_partner.

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
    LOOP AT airplanes INTO DATA(airplane) WHERE table_line IS INSTANCE OF zcl_09_cargo_plane.
      DATA(cargo_plane) = CAST zcl_09_cargo_plane( airplane ).

      IF result IS INITIAL OR ( cargo_plane->cargo_in_tons > result->cargo_in_tons ).
        result = cargo_plane.
      ENDIF.
    ENDLOOP.

    IF result IS INITIAL.
      RAISE EXCEPTION TYPE zcx_09_cargo_plane.
    ENDIF.
  ENDMETHOD.

  METHOD zif_009_partner~to_string.
    result = name && ';'.

    LOOP AT airplanes INTO DATA(airplane).
      result &&= airplane->to_string(  ) && ';'.
    ENDLOOP.

    result &&= |Biggest Cargo Plane: { get_biggest_cargo_plane(  )->to_string(  ) }|.
  ENDMETHOD.

ENDCLASS.
