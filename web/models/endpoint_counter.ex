defmodule OpenLambda.EndpointCounter do
  use OpenLambda.Web, :model
  alias Ecto.DateTime
  @derive {Poison.Encoder, except: [:__meta__]}

  schema "endpoint_counter" do
    field :endpoint_id, :integer
    field :counter, :string
    field :step, :integer
    field :type, :string
    field :ts, :integer
    field :t_create, Ecto.DateTime
    field :t_modify, Ecto.DateTime
  end

end
