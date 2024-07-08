# Practicing dbt with sample project: `jaffle_shop`

`jaffle_shop` is a fictional ecommerce store. This dbt project transforms raw data from an app database into a customers and orders model ready for analytics.

<details>
<summary>

## What is this repo?

</summary>

What this repo _is_:
- A self-contained playground dbt project, useful for testing out scripts, and communicating some of the core dbt concepts.

What this repo _is not_:
- A tutorial — check out the [Getting Started Tutorial](https://docs.getdbt.com/tutorial/setting-up) for that. Notably, this repo contains some anti-patterns to make it self-contained, namely the use of seeds instead of sources.
- A demonstration of best practices — check out the [dbt Learn Demo](https://github.com/dbt-labs/dbt-learn-demo) repo instead. We want to keep this project as simple as possible. As such, we chose not to implement:
    - our standard file naming patterns (which make more sense on larger projects, rather than this five-model project)
    - a pull request flow
    - CI/CD integrations
- A demonstration of using dbt for a high-complex project, or a demo of advanced features (e.g. macros, packages, hooks, operations) — we're just trying to keep things simple here!

</details>

<details>
<summary>

## What's in this repo?

</summary>

This repo contains [seeds](https://docs.getdbt.com/docs/building-a-dbt-project/seeds) that includes some (fake) raw data from a fictional app along with some basic dbt [models](https://docs.getdbt.com/docs/building-a-dbt-project/building-models), tests, and docs for this data.

The raw data consists of customers, orders, and payments, with the following entity-relationship diagram:

![Jaffle Shop ERD](/etc/jaffle_shop_erd.png)

</details>

## Running this project
Prerequisities: Python >= 3.5