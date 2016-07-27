defmodule OpenLambda.EndpointsController do
  use OpenLambda.Web, :controller
  alias OpenLambda.Repo
  alias OpenLambda.Endpoints
  alias OpenLambda.EndpointCounter
  import Ecto.Query

  def index(conn, _params) do
    ee = Repo.all Endpoints
    json(conn, %{endpoints: ee})
  end

  def query_endpoints(conn, params) do
    query_str = Map.get(params, "query_str", ".+")
    # q = from e in Endpoints,
    #     where: like(e.endpoint, ".+")1
    s = Repo.execute_and_load("SELECT * from endpoint WHERE endpoint regexp ?", [query_str], Endpoints)
    json(conn, %{input: s, query_str: query_str})
  end

  def query_counter(conn, params) do
    query_str = Map.get(params, "query_str", ".+")
    # q = from e in Endpoints,
    #     where: like(e.endpoint, ".+")1
    s = Repo.execute_and_load("SELECT * from endpoint_counter WHERE counter regexp ?", [query_str], EndpointCounter)
    json(conn, %{input: s, query_str: query_str})
  end

end
