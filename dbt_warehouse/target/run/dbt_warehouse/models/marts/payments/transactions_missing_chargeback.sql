
  
    

  create  table "prod_dwh"."dwh_marts.payments"."transactions_missing_chargeback__dbt_tmp"
  
  
    as
  
  (
    -- transcations_missing_chargeback.sql

with

chargeback_report as  (
    select * from "prod_dwh"."dwh_staging"."stg_globepay__chargeback_report"
),

missing_chargeback as (
    select
        *
    from chargeback_report
    where 
        not is_chargeback
)

select * from missing_chargeback
  );
  