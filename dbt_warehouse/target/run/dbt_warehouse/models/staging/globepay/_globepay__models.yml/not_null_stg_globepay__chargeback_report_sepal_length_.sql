select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select sepal_length_
from "prod_dwh"."dwh_staging"."stg_globepay__chargeback_report"
where sepal_length_ is null



      
    ) dbt_internal_test