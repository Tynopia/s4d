CLASS zcl_09_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA make TYPE string READ-ONLY.
    DATA model TYPE string READ-ONLY.

    METHODS set_make
      IMPORTING make TYPE string.

    METHODS set_model
      IMPORTING model TYPE string.

    METHODS to_string
      RETURNING VALUE(string) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_vehicle IMPLEMENTATION.

  METHOD set_make.
    me->make = make.
  ENDMETHOD.

  METHOD set_model.
    me->model = model.
  ENDMETHOD.

  METHOD to_string.
    string = |Vehicle: { make } { model }|.
  ENDMETHOD.

ENDCLASS.
