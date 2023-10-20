*&---------------------------------------------------------------------*
*& Report z09_abap_05
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09_abap_05.

**********************************************************************
* Types
**********************************************************************
TYPES ty_operator TYPE c.

**********************************************************************
* Input
**********************************************************************
PARAMETERS p_val_1 TYPE zabap_decimal.
PARAMETERS p_val_2 TYPE zabap_decimal.
PARAMETERS p_oper TYPE ty_operator AS LISTBOX VISIBLE LENGTH 20.

DATA result TYPE zabap_decimal.
DATA error TYPE i.

CASE p_oper.
  WHEN '+'.
    result = zcl_09_calculator=>addition(
                 value1 = p_val_1
                 value2 = p_val_2
               ).
  WHEN '-'.
    result = zcl_09_calculator=>substraction(
                 value1 = p_val_1
                 value2 = p_val_2
               ).
  WHEN '*'.
    result = zcl_09_calculator=>multiply(
                 value1 = p_val_1
                 value2 = p_val_2
               ).
  WHEN '%'.
    result = zcl_09_calculator=>percentage(
                 percentage = p_val_1
                 base_value = p_val_2
               ).
  WHEN '^'.
    result = zcl_abap_calculator=>calculate_power(
                 base = p_val_1
                 exponent = p_val_2
               ).
ENDCASE.

WRITE |{ p_val_1 } { p_oper } { p_val_2 } = { result }|.

AT SELECTION-SCREEN ON p_oper.
  IF p_oper = ''.
    MESSAGE e000(z09_calculator).
  ENDIF.

AT SELECTION-SCREEN.
  TRY.
      result = zcl_09_calculator=>divide(
                   value1 = p_val_1
                   value2 = p_val_2
                 ).
    CATCH cx_sy_zerodivide INTO DATA(exception).
      MESSAGE e001(z09_calculator).
  ENDTRY.
**********************************************************************
* Select
**********************************************************************
AT SELECTION-SCREEN OUTPUT.
  DATA:
    name  TYPE vrm_id,
    value TYPE vrm_value,
    list  TYPE vrm_values.
  name = 'P_OPER'.

  value-key = '*'.
  value-text = TEXT-mpy.
  APPEND value TO list.

  value-key = '/'.
  value-text = TEXT-div.
  APPEND value TO list.

  value-key = '+'.
  value-text = TEXT-add.
  APPEND value TO list.

  value-key = '-'.
  value-text = TEXT-sub.
  APPEND value TO list.

  value-key = '%'.
  value-text = TEXT-per.
  APPEND value TO list.

  value-key = '^'.
  value-text = TEXT-pow.
  APPEND value TO list.

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id     = name
      values = list.
