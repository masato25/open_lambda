defmodule OpenLambda.Endpoints do
  use OpenLambda.Web, :model
  alias Ecto.DateTime
  @derive {Poison.Encoder, except: [:__meta__]}

  schema "endpoint" do
    field :endpoint, :string
    field :ts, :integer
    field :t_create, Ecto.DateTime
    field :t_modify, Ecto.DateTime
  end

end
