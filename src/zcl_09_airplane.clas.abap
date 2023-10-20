CLASS zcl_09_airplane DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA name TYPE string READ-ONLY.
    DATA plane_type TYPE string READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE integer READ-ONLY.

    METHODS to_string ABSTRACT
      RETURNING VALUE(string) TYPE string.

    METHODS constructor
      IMPORTING
        name       TYPE string
        plane_type TYPE string
        carrier    TYPE REF TO zcl_09_carrier
      RAISING
        zcx_09_initial_paramter.

  PROTECTED SECTION.
    METHODS throw
      IMPORTING type TYPE string
      RAISING
                zcx_09_initial_paramter.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_airplane IMPLEMENTATION.
  METHOD constructor.
    IF name IS INITIAL OR plane_type IS INITIAL.
      throw( 'NAME' ).
    ENDIF.

    IF plane_type IS INITIAL.
      throw( 'PLANE_TYPE' ).
    ENDIF.

    IF carrier IS INITIAL.
      throw( 'CARRIER' ).
    ENDIF.

    carrier->add_airplane( me ).

    me->name = name.
    me->plane_type = plane_type.

    number_of_airplanes += 1.
  ENDMETHOD.

  METHOD throw.
    RAISE EXCEPTION TYPE zcx_09_initial_paramter
      EXPORTING
        parameter = type.
  ENDMETHOD.

ENDCLASS.
