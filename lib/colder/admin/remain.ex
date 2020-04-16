defmodule Colder.Admin.Remain do
  use Ecto.Schema
  import Ecto.Changeset

  schema "remains" do
    field :firstname, :string
    field :idNumber, :string
    field :lastname, :string
    field :middlename, :string

    timestamps()
  end

  @doc false
  def changeset(remain, attrs) do
    remain
    |> cast(attrs, [:lastname, :middlename, :firstname, :idNumber])
    |> validate_required([:lastname, :middlename, :firstname, :idNumber])
  end
end
