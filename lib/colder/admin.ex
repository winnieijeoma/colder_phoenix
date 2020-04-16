defmodule Colder.Admin do
  @moduledoc """
  The Admin context.
  """

  import Ecto.Query, warn: false
  alias Colder.Repo

  alias Colder.Admin.Remain

  @doc """
  Returns the list of remains.

  ## Examples

      iex> list_remains()
      [%Remain{}, ...]

  """
  def list_remains do
    Repo.all(Remain)
  end

  @doc """
  Gets a single remain.

  Raises `Ecto.NoResultsError` if the Remain does not exist.

  ## Examples

      iex> get_remain!(123)
      %Remain{}

      iex> get_remain!(456)
      ** (Ecto.NoResultsError)

  """
  def get_remain!(id), do: Repo.get!(Remain, id)

  @doc """
  Creates a remain.

  ## Examples

      iex> create_remain(%{field: value})
      {:ok, %Remain{}}

      iex> create_remain(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_remain(attrs \\ %{}) do
    %Remain{}
    |> Remain.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a remain.

  ## Examples

      iex> update_remain(remain, %{field: new_value})
      {:ok, %Remain{}}

      iex> update_remain(remain, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_remain(%Remain{} = remain, attrs) do
    remain
    |> Remain.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a remain.

  ## Examples

      iex> delete_remain(remain)
      {:ok, %Remain{}}

      iex> delete_remain(remain)
      {:error, %Ecto.Changeset{}}

  """
  def delete_remain(%Remain{} = remain) do
    Repo.delete(remain)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking remain changes.

  ## Examples

      iex> change_remain(remain)
      %Ecto.Changeset{source: %Remain{}}

  """
  def change_remain(%Remain{} = remain) do
    Remain.changeset(remain, %{})
  end
end
