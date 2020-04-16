defmodule ColderWeb.RemainController do
  use ColderWeb, :controller

  alias Colder.Admin
  alias Colder.Admin.Remain

  def index(conn, _params) do
    remains = Admin.list_remains()
    render(conn, "index.html", remains: remains)
  end

  def new(conn, _params) do
    changeset = Admin.change_remain(%Remain{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"remain" => remain_params}) do
    case Admin.create_remain(remain_params) do
      {:ok, remain} ->
        conn
        |> put_flash(:info, "Remain created successfully.")
        |> redirect(to: Routes.remain_path(conn, :show, remain))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    remain = Admin.get_remain!(id)
    render(conn, "show.html", remain: remain)
  end

  # def show1(conn, %{"id" => id}) do
  #   remain = Admin.get_remain!(id)
  #   render(conn, "show1.html", remain: remain)
  # end

  def edit(conn, %{"id" => id}) do
    remain = Admin.get_remain!(id)
    changeset = Admin.change_remain(remain)
    render(conn, "edit.html", remain: remain, changeset: changeset)
  end

  def update(conn, %{"id" => id, "remain" => remain_params}) do
    remain = Admin.get_remain!(id)

    case Admin.update_remain(remain, remain_params) do
      {:ok, remain} ->
        conn
        |> put_flash(:info, "Remain updated successfully.")
        |> redirect(to: Routes.remain_path(conn, :show, remain))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", remain: remain, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    remain = Admin.get_remain!(id)
    {:ok, _remain} = Admin.delete_remain(remain)

    conn
    |> put_flash(:info, "Remain deleted successfully.")
    |> redirect(to: Routes.remain_path(conn, :index))
  end
end
