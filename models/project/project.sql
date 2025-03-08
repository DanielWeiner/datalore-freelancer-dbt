WITH source_table_numbered AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY `id`, `execution_time`) AS `row_number`
    FROM {{ source('freelancer_projects', 'projects') }}
)
SELECT * EXCEPT(row_number)
FROM source_table_numbered
WHERE row_number = 1