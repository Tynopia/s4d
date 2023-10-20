CLASS zcl_09_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS addition
      IMPORTING value1        TYPE zabap_decimal
                value2        TYPE zabap_decimal
      RETURNING VALUE(result) TYPE zabap_decimal.

    CLASS-METHODS substraction
      IMPORTING value1        TYPE zabap_decimal
                value2        TYPE zabap_decimal
      RETURNING VALUE(result) TYPE zabap_decimal.

    CLASS-METHODS multiply
      IMPORTING value1        TYPE zabap_decimal
                value2        TYPE zabap_decimal
      RETURNING VALUE(result) TYPE zabap_decimal.

    CLASS-METHODS divide
      IMPORTING value1        TYPE zabap_decimal
                value2        TYPE zabap_decimal
      RETURNING VALUE(result) TYPE zabap_decimal
      RAISING   cx_sy_zerodivide.

    CLASS-METHODS percentage
      IMPORTING percentage    TYPE zabap_decimal
                base_value    TYPE zabap_decimal
      RETURNING VALUE(result) TYPE zabap_decimal.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_calculator IMPLEMENTATION.
  METHOD addition.
    result = value1 + value2.
  ENDMETHOD.

  METHOD substraction.
    result = value1 - value2.
  ENDMETHOD.

  METHOD divide.
    result = value1 / value2.
  ENDMETHOD.

  METHOD multiply.
    result = value1 * value2.
  ENDMETHOD.

  METHOD percentage.
    result =  percentage * ( base_value / 100 ).
  ENDMETHOD.

ENDCLASS.
