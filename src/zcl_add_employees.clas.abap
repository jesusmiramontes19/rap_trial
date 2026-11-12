CLASS zcl_add_employees DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_add_employees IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_employees TYPE STANDARD TABLE OF zjgmg_cld WITH EMPTY KEY.
     DATA lv_timestamp TYPE timestampl.

    " Usuario actual vía XCO
    DATA(lv_user) = xco_cp=>sy->user( )->name.

    " Timestamp largo (UTC) para los campos administrativos
    GET TIME STAMP FIELD lv_timestamp.

    " Datos de ejemplo (el campo client se llena automáticamente)
    lt_employees = VALUE #(
      ( empid = '0000000001' fname = 'Jesús'    lname = 'Miramontes v2' cntry_key = 'MX' )
      ( empid = '0000000002' fname = 'María'    lname = 'González'   cntry_key = 'MX' )
      ( empid = '0000000003' fname = 'John'     lname = 'Smith'      cntry_key = 'US' )
      ( empid = '0000000004' fname = 'Anna'     lname = 'Schmidt'    cntry_key = 'DE' )
      ( empid = '0000000005' fname = 'Carlos'   lname = 'Ramírez'    cntry_key = 'US' )
      ( empid = '0000000006' fname = 'Lucía'    lname = 'Fernández v2'  cntry_key = 'CA' )
    ).

      " Llenar los campos administrativos en todos los registros
    LOOP AT lt_employees ASSIGNING FIELD-SYMBOL(<ls_employee>).
      <ls_employee>-created_by            = lv_user.
      <ls_employee>-created_at            = lv_timestamp.
      <ls_employee>-last_changed_by       = lv_user.
      <ls_employee>-last_changed_at       = lv_timestamp.
      <ls_employee>-local_last_changed_at = lv_timestamp.
    ENDLOOP.

    " Limpiar la tabla para poder ejecutar la clase varias veces
    DELETE FROM zjgmg_cld.

    " Insertar los registros
    INSERT zjgmg_cld FROM TABLE @lt_employees.

    IF sy-subrc = 0.
      out->write( |Se insertaron { lines( lt_employees ) } registros en tabla ZJGMG_CLD| ).
    ELSE.
      out->write( |Error al insertar registros| ).
    ENDIF.

    " Mostrar el contenido de la tabla
    SELECT * FROM zjgmg_cld INTO TABLE @DATA(lt_result).
    out->write( lt_result ).

  ENDMETHOD.

ENDCLASS.
