
  create view "prod_dwh"."dwh_staging"."stg_globepay__chargeback_report__dbt_tmp"
    
    
  as (
    -- stg_globepay__chargeback_report.sql

with source as (
    select * from "prod_dwh"."raw"."src_globepay__chargeback_report"
),

renamed as (
    select
        -- ids
        external_ref,

        -- strings
        source,

        -- booleans
        chargeback as is_chargeback,
        status

    from source

)

select * from renamed
  );