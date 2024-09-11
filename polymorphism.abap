*&---------------------------------------------------------------------*
*& Report ZJS_POLY_DEMO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zjs_poly_demo.

CLASS lcl_flower DEFINITION.
  PUBLIC SECTION.
    METHODS: bloom.
ENDCLASS.

CLASS lcl_flower IMPLEMENTATION.
  METHOD bloom.
    WRITE: / 'A flower blooms in the garden.'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_rose DEFINITION INHERITING FROM lcl_flower.
  PUBLIC SECTION.
    METHODS: bloom REDEFINITION.
ENDCLASS.

CLASS lcl_rose IMPLEMENTATION.
  METHOD bloom.
    WRITE: / 'A rose blooms with vibrant red petals.'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_lily DEFINITION INHERITING FROM lcl_flower.
  PUBLIC SECTION.
    METHODS: bloom REDEFINITION.
ENDCLASS.

CLASS lcl_lily IMPLEMENTATION.
  METHOD bloom.
    WRITE: / 'A lily blooms with a sweet fragrance and pure white petals.'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_sunflower DEFINITION INHERITING FROM lcl_flower.
  PUBLIC SECTION.
    METHODS: bloom REDEFINITION.
ENDCLASS.

CLASS lcl_sunflower IMPLEMENTATION.
  METHOD bloom.
    WRITE: / 'A sunflower blooms, following the sun with its golden face.'.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA(lo_flower) = NEW lcl_flower( ).
  lo_flower->bloom( ).

  DATA(lo_rose) = NEW lcl_rose( ).
  lo_rose->bloom( ).

  DATA(lo_lily) = NEW lcl_lily( ).
  lo_lily->bloom( ).

  DATA(lo_sunflower) = NEW lcl_sunflower( ).
  lo_sunflower->bloom( ).
