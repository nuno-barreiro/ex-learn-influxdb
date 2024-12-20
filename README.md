# Learn InfluxDB using Elixir

## Dependencies
- [Instream](https://hex.pm/packages/instream): InfluxDB driver for Elixir

## InfluxDB Information

### Main Concepts 

- An **Organization** is a logical grouping of users, dashboards, tasks, buckets, and other resources. It is the top-level entity used to manage access to your data and resources in InfluxDB. Each user belongs to an organization, and all resources (e.g., buckets, dashboards) are scoped to an organization.
- Data is stored in **Buckets**, which are named locations for time series data with a defined **retention period**. The retention period determines how long each data point is persisted before being automatically deleted. Buckets can be compared to databases in traditional relational database systems (RDBMS), but they are optimized for time series data.
- A **Measurement** is a logical grouping of data points, similar to a table in a relational database. Each measurement contains multiple **series** and represents a specific type of data (e.g., "temperature" or "cpu_usage"). Measurements are not explicitly defined in InfluxDB; they are inferred from the `measurement` name in the data.
- Data can also be grouped at a low level using **Tag sets**, which are sets of key-value pairs (where values are strings). Tags are **indexed** and are primarily used for metadata or categorical information that you want to filter or group by (e.g., `region="us-west"` or `host="server1"`). Tags improve query performance when filtering or aggregating data.
- The **Field set** represents the actual data values in a time series. Fields are also key-value pairs, but unlike tags, **field values** can be numerical (e.g., integers, floats) or strings. Fields are **not indexed**, which makes them more efficient for storing large volumes of data but slower for filtering. Fields are used to store the actual measurements or metrics (e.g., `temperature=72.5` or `cpu_usage=0.85`).
- A **Series** is a unique combination of a measurement, tag set, and field set. It represents a single, time-ordered stream of data. For example, a series might represent the CPU usage of a specific server in a specific region. The number of series in a bucket is referred to as the **series cardinality**, which can impact performance and storage requirements.
- **Timestamps** in InfluxDB are based on Unix time and are stored in UTC with **nanosecond precision**. This allows for highly granular time series data, making InfluxDB suitable for applications requiring high-resolution timestamps.
- Data points are written to InfluxDB using the [Line Protocol](https://docs.influxdata.com/influxdb/cloud/reference/syntax/line-protocol/). Line Protocol is a simple, text-based format for writing time series data. Each line consists of a measurement, tag set, field set, and timestamp. For example: `temperature,location=us-west value=72.5 1672531200000000000` represents a measurement (`temperature`), a tag (`location=us-west`), a field (`value=72.5`), and a timestamp in nanoseconds.
- InfluxDB has built-in **secret management**. Secrets are write-only values that can be securely stored and used in Flux scripts. Secrets are useful for managing sensitive information like API keys, tokens, or passwords. They can be accessed in Flux using the `secrets.get()` function. 

### Additional Notes and Context

### Retention Policies
Buckets in InfluxDB are tied to a retention policy, which defines how long data is kept. For example, a bucket with a 30-day retention policy will automatically delete data older than 30 days. This is useful for managing storage costs and ensuring compliance with data retention requirements.

#### Schema Design
InfluxDB is schema-less, meaning you don't need to predefine your schema. However, careful schema design is critical for performance. For example:
- Use tags for metadata or categorical data you frequently filter or group by.
- Use fields for actual measurements or metrics.
- Avoid high cardinality in tags (e.g., using a tag for unique IDs like `user_id`).

#### Series Cardinality
Series cardinality is the total number of unique series in a bucket. High cardinality (e.g., millions of unique series) can impact performance and storage. To reduce cardinality:
- Minimize the number of unique tag combinations.
- Avoid using high-cardinality tags like UUIDs or timestamps.

### Storage Engines

| Engine | Query Languages | Delivery |
| - | - | - |
| TSM | InfluxQL, Flux | Cloud, On-Premises, OSS |
| IOx | InfluxQL, Flux, SQL | Cloud |

### Install and Configure the CLI

- Install using brew: `brew install influxdb-cli`
- Configure credentials (first time): `influx config create -n "ex_learn_influxdb_auth" -u "http://127.0.0.1:8086" -o "learn-influx" -t "local-dev-token"`

### Resources

- [InfluxDB University](https://university.influxdata.com/)
- [Time to Awesome - A book on InfluxDB](https://awesome.influxdata.com/)
- [Awesome InfluxDB - Curated List](https://github.com/mark-rushakoff/awesome-influxdb)
