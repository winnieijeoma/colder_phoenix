defmodule ColderWeb.RemainControllerTest do
  use ColderWeb.ConnCase

  alias Colder.Admin

  @create_attrs %{firstname: "some firstname", idNumber: "some idNumber", lastname: "some lastname", middlename: "some middlename"}
  @update_attrs %{firstname: "some updated firstname", idNumber: "some updated idNumber", lastname: "some updated lastname", middlename: "some updated middlename"}
  @invalid_attrs %{firstname: nil, idNumber: nil, lastname: nil, middlename: nil}

  def fixture(:remain) do
    {:ok, remain} = Admin.create_remain(@create_attrs)
    remain
  end

  describe "index" do
    test "lists all remains", %{conn: conn} do
      conn = get(conn, Routes.remain_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Remains"
    end
  end

  describe "new remain" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.remain_path(conn, :new))
      assert html_response(conn, 200) =~ "New Remain"
    end
  end

  describe "create remain" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.remain_path(conn, :create), remain: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.remain_path(conn, :show, id)

      conn = get(conn, Routes.remain_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Remain"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.remain_path(conn, :create), remain: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Remain"
    end
  end

  describe "edit remain" do
    setup [:create_remain]

    test "renders form for editing chosen remain", %{conn: conn, remain: remain} do
      conn = get(conn, Routes.remain_path(conn, :edit, remain))
      assert html_response(conn, 200) =~ "Edit Remain"
    end
  end

  describe "update remain" do
    setup [:create_remain]

    test "redirects when data is valid", %{conn: conn, remain: remain} do
      conn = put(conn, Routes.remain_path(conn, :update, remain), remain: @update_attrs)
      assert redirected_to(conn) == Routes.remain_path(conn, :show, remain)

      conn = get(conn, Routes.remain_path(conn, :show, remain))
      assert html_response(conn, 200) =~ "some updated firstname"
    end

    test "renders errors when data is invalid", %{conn: conn, remain: remain} do
      conn = put(conn, Routes.remain_path(conn, :update, remain), remain: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Remain"
    end
  end

  describe "delete remain" do
    setup [:create_remain]

    test "deletes chosen remain", %{conn: conn, remain: remain} do
      conn = delete(conn, Routes.remain_path(conn, :delete, remain))
      assert redirected_to(conn) == Routes.remain_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.remain_path(conn, :show, remain))
      end
    end
  end

  defp create_remain(_) do
    remain = fixture(:remain)
    {:ok, remain: remain}
  end
end
