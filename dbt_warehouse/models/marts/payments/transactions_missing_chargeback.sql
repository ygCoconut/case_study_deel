-- transactions_missing_chargeback.sql

with

chargeback_report as  (
    select * from {{ ref('stg_globepay__chargeback_report' )}}
),

missing_chargeback as (
    select
        *
    from chargeback_report
    where 
        not is_chargeback
)

select * from missing_chargeback 