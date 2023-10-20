CLASS zcl_09_travel_agency DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA name TYPE string READ-ONLY.
    DATA partners TYPE z09_partners READ-ONLY.

    METHODS constructor
      IMPORTING
        name TYPE string
      RAISING
        zcx_09_initial_paramter.

    METHODS add_partner
      IMPORTING
        partner TYPE REF TO zif_009_partner.

    METHODS to_string
      RETURNING VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_travel_agency IMPLEMENTATION.
  METHOD constructor.
    IF name IS INITIAL.
      RAISE EXCEPTION TYPE zcx_09_initial_paramter
        EXPORTING
          parameter = 'NAME'.
    ENDIF.

    me->name = name.
  ENDMETHOD.

  METHOD add_partner.
    APPEND partner TO partners.
  ENDMETHOD.

  METHOD to_string.
    result = name && ';'.

    LOOP AT partners INTO DATA(partner).
      result &&= partner->to_string(  ) && ';'.
    ENDLOOP.

    result &&= |Partners: { lines( partners ) }|.
  ENDMETHOD.

ENDCLASS.
