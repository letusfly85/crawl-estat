defmodule CrawlEstatTest do
  use ExUnit.Case
  doctest CrawlEstat

  test "the truth" do
    #CrawlEstat.find_life_table
    ids = CrawlEstat.find_stats_list("00450012", "2016")

    IO.inspect(ids)

    Enum.each(ids, fn(id) ->
      CrawlEstat.find_life_table(id)
    end)

    assert 1 + 1 == 2
  end
end
