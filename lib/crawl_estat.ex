defmodule CrawlEstat do
  @api_id System.get_env("api_id")

  require Logger
  require HTTPoison

  @doc"""
  """
  def find_stats_list(stats_code, surver_years) do
    url = Application.get_env(:crawl_estat, :stats_list_url) <> "?appId=" <> @api_id <> "&statsCode=#{stats_code}&surverYears=#{surver_years}"

    prob_response = HTTPoison.get(url)
    case prob_response do
      {:ok, response} ->
        Logger.info(inspect Floki.find(response.body, "table_inf"))

        Floki.find(response.body, "table_inf") |> Floki.attribute("id")
    end
  end

  @doc"""
  """
  def find_life_table(id) do
    url = Application.get_env(:crawl_estat, :stats_data_url) <> "?appId=" <> @api_id <> "&statsDataId=#{id}"

    prob_response = HTTPoison.get(url)
    case prob_response do
      {:ok, response} ->
        body = response.body
        Logger.info(body)

        Logger.info(inspect Floki.find(body, "total_number"))

    end
  end
end
