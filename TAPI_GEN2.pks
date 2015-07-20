CREATE OR REPLACE PACKAGE tapi_gen2
AS

   /**
   -- # TAPI_GEN2
   -- Generated by: Oscar Salvador Magallanes
   -- Website: github.com/osalvador/tapiGen2
   -- Created On: 16-JUL-2015
   */

   --Global public data structures
   SUBTYPE dbo_name_t IS VARCHAR2 (30); -- Max size for a DB object name

   TYPE dbo_name_aat IS TABLE OF dbo_name_t;
   
   
   /**
    --## Function Name: CREATE_TAPI_PACKAGE
    --### Description:
    --       Create PL/SQL Table API
    --
    --### IN Paramters
    --    | Name | Type | Description
    --    | -- | -- | --    
    --    |p_table_name | VARCHAR2 | must be NOT NULL
    --    |p_compile_table_api | BOOLEAN | TRUE for compile generated package, FALSE to DBMS_OUTPUT the source
    --    |p_unique_key | VARCHAR2 | If the table has no primary key, it indicates the column that will be used as a unique key
    --    |p_created_by_col_name | VARCHAR2 | Custom audit column
    --    |p_created_date_col_name | VARCHAR2 | Custom audit column
    --    |p_modified_by_col_name | VARCHAR2 | Custom audit column
    --    |p_modified_date_col_name | VARCHAR2 | Custom audit column     
    --    |p_raise_exceptions | BOOLEAN | TRUE to use logger for exception handling
    --### Amendments
    --| When         | Who                      | What
    --|--------------|--------------------------|------------------
    --|16-JUL-2015   | osalvador                | Created
    --|20-JUL-2015   | osalvador                | Added logger exception handling
    */   
   PROCEDURE create_tapi_package (p_table_name               IN VARCHAR2
                                , p_compile_table_api        IN BOOLEAN DEFAULT TRUE
                                , p_unique_key               IN VARCHAR2 DEFAULT NULL
                                , p_created_by_col_name      IN VARCHAR2 DEFAULT NULL
                                , p_created_date_col_name    IN VARCHAR2 DEFAULT NULL
                                , p_modified_by_col_name     IN VARCHAR2 DEFAULT NULL
                                , p_modified_date_col_name   IN VARCHAR2 DEFAULT NULL
                                , p_raise_exceptions         IN BOOLEAN DEFAULT TRUE);

   --Public functions but for internal use. 
   FUNCTION pk_col_name (p_table_name IN VARCHAR2)
      RETURN dbo_name_aat
      PIPELINED;

   FUNCTION tab_columns (p_table_name IN VARCHAR2, p_template IN VARCHAR2, p_delimiter IN VARCHAR2)
      RETURN VARCHAR2;
   
   FUNCTION pk_columns (p_table_name IN VARCHAR2, p_template IN VARCHAR2, p_delimiter IN VARCHAR2)
      RETURN VARCHAR2;
      
   FUNCTION tab_columns_sans_blobs (p_table_name IN VARCHAR2, p_template IN VARCHAR2, p_delimiter IN VARCHAR2)
      RETURN VARCHAR2;
      
   FUNCTION tab_columns_for_upd (p_table_name IN VARCHAR2, p_template IN VARCHAR2, p_delimiter IN VARCHAR2)
      RETURN VARCHAR2;               
    
END tapi_gen2;
/
