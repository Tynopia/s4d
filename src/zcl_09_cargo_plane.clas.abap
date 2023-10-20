CLASS zcl_09_cargo_plane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  INHERITING FROM zcl_09_airplane.

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE integer READ-ONLY.

    METHODS constructor
      IMPORTING
        name          TYPE string
        plane_type    TYPE string
        carrier       TYPE REF TO zcl_09_carrier
        cargo_in_tons TYPE integer
      RAISING
        zcx_09_initial_paramter.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_cargo_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name = name plane_type = plane_type carrier = carrier ).

    IF cargo_in_tons IS INITIAL.
      throw( 'CARGO_IN_TONS' ).
    ENDIF.

    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
    string = |{ name } { plane_type } { cargo_in_tons }|.
  ENDMETHOD.
ENDCLASS.
