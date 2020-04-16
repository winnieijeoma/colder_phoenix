defmodule Colder.Repo.Migrations.CreateRemains do
  use Ecto.Migration

  def change do
    create table(:remains) do
      add :lastname, :string
      add :middlename, :string
      add :firstname, :string
      add :idNumber, :string

      timestamps()
    end

  end
end
