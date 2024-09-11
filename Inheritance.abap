*&---------------------------------------------------------------------*
*& Report ZJS_INH_DEMO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zjs_inh_demo.

"" Do you love to read books?? let's visit some book stores.

CLASS master_books DEFINITION.

  " I can access the attributes and methods of this section even from outside the class.
  PUBLIC SECTION.
    DATA: public_book TYPE string.
    "Constructor
    METHODS constructor.
    "Static method
    CLASS-METHODS comic_corner.
    "Instance Method
    METHODS main_bookstore.                   "sells regular books and keeps track of the books in stock.
    METHODS sell_books_pub.

    " I can access the attributes and methods of this section only in the sub class.
  PROTECTED SECTION.
    DATA: protected_book TYPE string.
    METHODS special_edition_bookstore.        "focuses on selling special editions of books that require unique packaging

    " I can access the attributes and methods of this section only in this class.
  PRIVATE SECTION.
    DATA: private_book TYPE string.
    METHODS rare_collectible_bookstore.       "handles antique books that need special care
    METHODS sell_books_priv.

ENDCLASS.

CLASS master_books IMPLEMENTATION.

  METHOD constructor.
    public_book = 'Listen Papa'.
    protected_book = 'The Great Gatsby'.
    private_book = 'The lord of the rings'.
    WRITE: / public_book,
           / protected_book,
           / private_book.
  ENDMETHOD.

  METHOD comic_corner.
    WRITE : / 'Shakespeare’s First Folio'.
  ENDMETHOD.

  METHOD main_bookstore.
    WRITE : / 'Pride and Prejudice',
            / 'The Catcher in the Rye'.
  ENDMETHOD.

  METHOD sell_books_pub.
    me->sell_books_priv( ).
  ENDMETHOD.

  METHOD special_edition_bookstore.
    WRITE : / 'Game of Thrones'.
  ENDMETHOD.

  METHOD rare_collectible_bookstore.
    WRITE : / 'The Deep Ocean'.
  ENDMETHOD.

  METHOD sell_books_priv.
    WRITE : / 'Can not be called directly'.
  ENDMETHOD.

ENDCLASS.

CLASS handle_spe_ed_bookstore DEFINITION INHERITING FROM master_books.
  PUBLIC SECTION.
    METHODS sell_basic_special.
    METHODS sell_books_pub REDEFINITION.
ENDCLASS.

CLASS handle_spe_ed_bookstore IMPLEMENTATION.
  METHOD sell_basic_special.

    me->main_bookstore( ).                  "public method of super class
    me->special_edition_bookstore( ).       "protected method of super class

    WRITE: / 'Accessing public attribute from superclass:', public_book.
    WRITE: / 'Accessing protected attribute from superclass:', protected_book.

  ENDMETHOD.

  METHOD sell_books_pub.
    WRITE : / 'I am part-2 of sell_books_pub but I have a different story'.
  ENDMETHOD.

ENDCLASS.

CLASS handle_rare_coll_bookstore DEFINITION INHERITING FROM master_books.
  PUBLIC SECTION.
    METHODS sell_basic_rare.
ENDCLASS.

CLASS handle_rare_coll_bookstore IMPLEMENTATION.
  METHOD sell_basic_rare.
    me->main_bookstore( ).
*  me->rare_collectible_bookstore( ).   "This line will give error as I tried to access private method of super class

    WRITE: / 'Accessing public attribute from superclass:', public_book.
*  WRITE: / 'Accessing private attribute from superclass:', private_book. "error as I tried to access private attribute of super class

  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  master_books=>comic_corner( ). "Comic_corner can be called without a object as it is a static method.

  "object for master_books, also constructor automatically called when an object is created.
  DATA(lv_main) = NEW master_books( ).

  lv_main->main_bookstore( ).
  lv_main->sell_books_pub( ).

  DATA(lv_spe) = NEW handle_spe_ed_bookstore( ).    "object for handle_spe_ed_bookstore
  lv_spe->sell_basic_special( ).
  lv_spe->sell_books_pub( ).

  DATA(lv_rare) = NEW handle_rare_coll_bookstore( ).   "object for handle_rare_coll_bookstore
  lv_rare->sell_basic_rare( ).
