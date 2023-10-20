*&---------------------------------------------------------------------*
*& Report z09_abap_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09_abap_03.

**********************************************************************
* Types
**********************************************************************
TYPES ty_operator TYPE c.
TYPES ty_value TYPE p LENGTH 8 DECIMALS 4.
TYPES ty_operator_list TYPE SORTED TABLE OF ty_operator WITH UNIQUE KEY table_line.

**********************************************************************
* Operatoren
**********************************************************************
DATA(operators) = VALUE ty_operator_list( ( |/| ) ( |*| ) ( |+| ) ( |-| ) ).

**********************************************************************
* Input
**********************************************************************
PARAMETERS p_val_1 TYPE ty_value.
PARAMETERS p_val_2 TYPE ty_value.
PARAMETERS p_oper TYPE ty_operator AS LISTBOX VISIBLE LENGTH 5 DEFAULT '*'.

DATA result TYPE ty_value.
DATA error TYPE i.

CASE p_oper.
  WHEN '+'.
    result = p_val_1 + p_val_2.
  WHEN '-'.
    result = p_val_1 - p_val_2.
  WHEN '*'.
    result = p_val_1 * p_val_2.
  WHEN '/'.
    result = p_val_1 / p_val_2.
  WHEN OTHERS.
    error = 1.
ENDCASE.

AT SELECTION-SCREEN ON p_oper.
  IF error IS NOT INITIAL.
    MESSAGE e000(z09_calculator) WITH p_oper ''.
  ELSE.
    WRITE |{ p_val_1 } { p_oper } { p_val_1 } = { result }|.
  ENDIF.

**********************************************************************
* Select
**********************************************************************
AT SELECTION-SCREEN OUTPUT.
  DATA:
    name  TYPE vrm_id,
    operator TYPE ty_operator,
    value TYPE vrm_value,
    list  TYPE vrm_values.
  name = 'P_OPER'.

    operator = '*'.

    value-key = operator.
    value-text = operator.
    APPEND value TO list.

    operator = '/'.

    value-key = operator.
    value-text = operator.
    APPEND value TO list.

    operator = '+'.

    value-key = operator.
    value-text = operator.
    APPEND value TO list.

    operator = '-'.

    value-key = operator.
    value-text = operator.
    APPEND value TO list.

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id     = name
      values = list.
