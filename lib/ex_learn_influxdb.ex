defmodule ExLearnInfluxdb do
  alias ExLearnInfluxdb.InfluxDbConnection

  def write_plain_map_datapoint do
    data_point = %{
      measurement: "sample_measurement",
      fields: %{numfield: 1, strfield: "2"},
      tags: %{tag1: "value1", tag2: "value2"},
      timestamp: DateTime.utc_now() |> DateTime.to_unix(:nanosecond)
    }

    InfluxDbConnection.write(data_point)
  end
end
