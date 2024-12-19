# Learn InfluxDB using Elixir

## Dependencies
- [Instream](https://hex.pm/packages/instream): InfluxDB driver for Elixir

## Concepts 

- All InfluxDB data is stored in a **Bucket**, which combines the concept of a database and a retention period that sets the duration of time each data point is persisted.
- A **Measurement** is a group of data at a high level, which can almost be compared to a table in ER terms. 
- Data can also be grouped at a low lever using **Tag sets**, which are sets of key-value pairs (values are strings).
- Representation of data is a **Field set**, also a set of key-value pairs but in fields values are numerical and strings.
- **Timestamps** of data is based in Unix time and stored in UTC with nanosecond precision.
- **Series** are unique combinations of measure and tags.
- Data points are written in InfluxDB using [Line Protocol](https://docs.influxdata.com/influxdb/cloud/reference/syntax/line-protocol/)

