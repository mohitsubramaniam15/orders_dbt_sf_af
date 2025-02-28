python -m venv myenv
Set-ExecutionPolicy Unrestricted -Scope Process
myenv\Scripts\Activate
pip install dbt-snowflake
pip install dbt-core
dbt init
dbt deps
dbt run
dbt run -s int_order_items 
~/.dbt/profiles.yml
dbt test
winget install -e --id Astronomer.Astro
astro dev init
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \ 
    pip install --no-cache-dir dbt-snowflake && activate
