INTERFACE zif_009_partner
  PUBLIC .

  METHODS to_string
    RETURNING VALUE(result) TYPE string
    RAISING
      zcx_09_cargo_plane.

ENDINTERFACE.
