defmodule OpenLambda.PageController do
  use OpenLambda.Web, :controller
  alias OpenLambda.Repo
  alias OpenLambda.Endpoints

  def index(conn, _params) do
    ee = Repo.all Endpoints
    json(conn, %{res: ee})
  end
end
