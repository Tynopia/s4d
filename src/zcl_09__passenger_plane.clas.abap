CLASS zcl_09__passenger_plane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  INHERITING FROM zcl_09_airplane.

  PUBLIC SECTION.
    DATA number_of_seats TYPE integer READ-ONLY.

    METHODS constructor
      IMPORTING
        name            TYPE string
        plane_type      TYPE string
        carrier         TYPE REF TO zcl_09_carrier
        number_of_seats TYPE integer
      RAISING
        zcx_09_initial_paramter.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09__passenger_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name = name plane_type = plane_type carrier = carrier ).

    IF number_of_seats IS INITIAL.
      throw( 'NUMBER_OF_SEATS' ).
    ENDIF.

    me->number_of_seats = number_of_seats.
  ENDMETHOD.

  METHOD to_string.
    string = |{ name } { plane_type } { number_of_seats }|.
  ENDMETHOD.
ENDCLASS.
