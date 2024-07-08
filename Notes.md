# Notes

###  Models 

- dbt run will materialize models into the data warehouse. **Default materialization is a view**.
- Default materialization for a model can be changed in dbt_project.yml or can be altered for a particular sql file using 
  `{{ config(materialized='*typeofmaterialisation*') }}` at the top
-    **Sources**  (`src`) refer to the raw table data that have been built in the warehouse through a loading process.
-   **Staging**  (`stg`) refers to models that are built directly on top of sources. These have a one-to-one relationship with sources tables. These are used for very light transformations that shape the data into what you want it to be. These models are used to clean and standardize the data before transforming data downstream. Note: These are typically materialized as views.
-   **Intermediate**  (`int`) refers to any models that exist between final fact and dimension tables. These should be built on staging models rather than directly on sources to leverage the data cleaning that was done in staging.
-   **Fact**  (`fct`) refers to any data that represents something that occurred or is occurring. Examples include sessions, transactions, orders, stories, votes. These are typically skinny, long tables.
-   **Dimension**  (`dim`) refers to data that represents a person, place or thing. Examples include customers, products, candidates, buildings, employees.
- To run/test individual models, use dbt run -s *modelname* ( eg dbt run -s staging or dbt test -s staging)

### Sources

- Setting up sources and referring to them with the sources enables dbt source freshness.
- Using source function instead of ref function enables sources to be green in DAG.
- Source freshness needs to be added in yml file where sources are configured;
    
      loaded_at_field: _etl_loaded_at   #column that stores datetime value that the data was loaded at
      freshness:  
    	warn_after: {count:  12, period:  hour}  #warning if 12 hours have passed since etl_loaded at value
    	error_after: {count:  24, period:  hour}  #error if 12 hours have passed since etl_loaded at value

### Tests

- Two types of test: Generic and Singular
- Generic is used in yml config files for each model
- Singular tests are sql code snippets inserted in tests folder 
- dbt ships with four built in tests: unique, not null, accepted values, relationships;
	-   **Unique**  tests to see if every value in a column is unique
	-   **Not_null**  tests to see if every value in a column is not null
	-   **Accepted_values**  tests to make sure every value in a column is equal to a value in a provided list
	-   **Relationships**  tests to ensure that every value in a column exists in a column in another model	
	-  Example : ![DBT Tests](https://i.ibb.co/G2YRK6x/Screenshot-2024-07-08-220220.png)