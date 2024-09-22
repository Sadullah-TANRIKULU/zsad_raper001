CLASS lhc_zr_sad_empinfo DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Empinfo
        RESULT result,
      detSalary FOR DETERMINE ON SAVE
        IMPORTING keys FOR Empinfo~detSalary,
      detTaxrate FOR DETERMINE ON SAVE
        IMPORTING keys FOR Empinfo~detTaxrate,
      detKids FOR DETERMINE ON SAVE
        IMPORTING keys FOR Empinfo~detKids,
      detContract FOR DETERMINE ON SAVE IMPORTING keys FOR Empinfo~detContract.
ENDCLASS.

CLASS lhc_zr_sad_empinfo IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD detSalary.

    READ ENTITIES OF zr_sad_empinfo IN LOCAL MODE
    ENTITY Empinfo
    FIELDS ( Role ) WITH CORRESPONDING #( keys )
    RESULT DATA(employees).

    LOOP AT employees INTO DATA(employee).

      IF employee-Role = 'Backend Dev'.

        MODIFY ENTITIES OF zr_sad_empinfo IN LOCAL MODE
        ENTITY Empinfo
        UPDATE
        FIELDS ( Salary )
        WITH VALUE #(
        ( %tky = employee-%tky Salary = 20000 )
        ).

      ELSEIF employee-Role = 'Frontend Dev'.

        MODIFY ENTITIES OF zr_sad_empinfo IN LOCAL MODE
        ENTITY Empinfo
        UPDATE
        FIELDS ( Salary )
        WITH VALUE #(
        ( %tky = employee-%tky Salary = 18900 )
         ).

      ELSEIF employee-Role = 'Fullstack Dev'.

        MODIFY ENTITIES OF zr_sad_empinfo IN LOCAL MODE
        ENTITY Empinfo
        UPDATE
        FIELDS ( Salary )
        WITH VALUE #(
        ( %tky = employee-%tky Salary = 38900 )
         ).


      ENDIF.

    ENDLOOP.

  ENDMETHOD.
  METHOD detTaxrate.

    READ ENTITIES OF zr_sad_empinfo IN LOCAL MODE
      ENTITY Empinfo
      FIELDS ( Salary ) WITH CORRESPONDING #( keys )
      RESULT DATA(rates).

    LOOP AT rates INTO DATA(rate).

      IF rate-Salary > 21000.

        MODIFY ENTITIES OF zr_sad_empinfo IN LOCAL MODE
        ENTITY Empinfo
        UPDATE
        FIELDS ( Taxrate )
        WITH VALUE #(
        ( %tky = rate-%tky Taxrate = '12.12' )
         ).

      ELSE.

        MODIFY ENTITIES OF zr_sad_empinfo IN LOCAL MODE
        ENTITY Empinfo
        UPDATE
        FIELDS ( Taxrate )
        WITH VALUE #(
        ( %tky = rate-%tky Taxrate = '5.14' )
         ).

      ENDIF.


    ENDLOOP.
  ENDMETHOD.
  METHOD detKids.

    READ ENTITIES OF zr_sad_empinfo IN LOCAL MODE
    ENTITY Empinfo
    FIELDS ( Kids Salary ) WITH CORRESPONDING #( keys )
    RESULT DATA(kidpayments).

    LOOP AT kidpayments INTO DATA(kidpayment).

      IF kidpayment-Kids = abap_true.

        MODIFY ENTITIES OF zr_sad_empinfo IN LOCAL MODE
        ENTITY Empinfo
        UPDATE
        FIELDS ( Salary )
        WITH VALUE #(
        ( %tky = kidpayment-%tky Salary = kidpayment-Salary + 2000 )
         ).

      ENDIF.


    ENDLOOP.
  ENDMETHOD.
  METHOD detcontract.

    READ ENTITIES OF zr_sad_empinfo IN LOCAL MODE
    ENTITY Empinfo
    FIELDS ( Experience CurContractStart CurContractEnd ) WITH CORRESPONDING #( keys )
    RESULT DATA(contract_statuses).

    DATA diff TYPE i.

    LOOP AT contract_statuses INTO DATA(status).

      DATA(contractEnd) = CONV i( substring( val = status-CurContractEnd off = 0 len = 4 ) ).
      DATA(contractStart) = CONV i( substring( val = status-CurContractStart off = 0 len = 4 ) ).

      diff = contractEnd - contractStart.

      IF diff > 4.

        MODIFY ENTITIES OF zr_sad_empinfo IN LOCAL MODE
        ENTITY Empinfo
        UPDATE
        FIELDS ( Experience )
        WITH VALUE #(
        ( %tky = status-%tky Experience = status-Experience + 4 )
         ).

      ELSEIF diff > 3.

        MODIFY ENTITIES OF zr_sad_empinfo IN LOCAL MODE
        ENTITY Empinfo
        UPDATE
        FIELDS ( Experience )
        WITH VALUE #(
        ( %tky = status-%tky Experience = status-Experience + 3 )
         ).

      ELSEIF diff > 2.

        MODIFY ENTITIES OF zr_sad_empinfo IN LOCAL MODE
        ENTITY Empinfo
        UPDATE
        FIELDS ( Experience )
        WITH VALUE #(
        ( %tky = status-%tky Experience = status-Experience + 2 )
         ).

      ELSEIF diff > 1.

        MODIFY ENTITIES OF zr_sad_empinfo IN LOCAL MODE
        ENTITY Empinfo
        UPDATE
        FIELDS ( Experience )
        WITH VALUE #(
        ( %tky = status-%tky Experience = status-Experience + 1 )
         ).

      ENDIF.

    ENDLOOP.



















    "
  ENDMETHOD.

ENDCLASS.
