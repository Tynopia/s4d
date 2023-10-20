*&---------------------------------------------------------------------*
*& Report z09_main_vehicles
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09_main_vehicles.

**********************************************************************
* Demo 1: Objekte und Referenzvariablen
**********************************************************************
DATA vehicle TYPE REF TO zcl_09_vehicle.

" vehicle = new #(  ).
vehicle = new zcl_09_vehicle(  ).

vehicle->set_make( 'VW' ).
vehicle->set_model( 'Up' ).
vehicle->set_make( 'Porsche' ).

WRITE vehicle->to_string(  ).
