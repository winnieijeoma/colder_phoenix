defmodule Colder.AdminTest do
  use Colder.DataCase

  alias Colder.Admin

  describe "remains" do
    alias Colder.Admin.Remain

    @valid_attrs %{firstname: "some firstname", idNumber: "some idNumber", lastname: "some lastname", middlename: "some middlename"}
    @update_attrs %{firstname: "some updated firstname", idNumber: "some updated idNumber", lastname: "some updated lastname", middlename: "some updated middlename"}
    @invalid_attrs %{firstname: nil, idNumber: nil, lastname: nil, middlename: nil}

    def remain_fixture(attrs \\ %{}) do
      {:ok, remain} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_remain()

      remain
    end

    test "list_remains/0 returns all remains" do
      remain = remain_fixture()
      assert Admin.list_remains() == [remain]
    end

    test "get_remain!/1 returns the remain with given id" do
      remain = remain_fixture()
      assert Admin.get_remain!(remain.id) == remain
    end

    test "create_remain/1 with valid data creates a remain" do
      assert {:ok, %Remain{} = remain} = Admin.create_remain(@valid_attrs)
      assert remain.firstname == "some firstname"
      assert remain.idNumber == "some idNumber"
      assert remain.lastname == "some lastname"
      assert remain.middlename == "some middlename"
    end

    test "create_remain/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_remain(@invalid_attrs)
    end

    test "update_remain/2 with valid data updates the remain" do
      remain = remain_fixture()
      assert {:ok, %Remain{} = remain} = Admin.update_remain(remain, @update_attrs)
      assert remain.firstname == "some updated firstname"
      assert remain.idNumber == "some updated idNumber"
      assert remain.lastname == "some updated lastname"
      assert remain.middlename == "some updated middlename"
    end

    test "update_remain/2 with invalid data returns error changeset" do
      remain = remain_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_remain(remain, @invalid_attrs)
      assert remain == Admin.get_remain!(remain.id)
    end

    test "delete_remain/1 deletes the remain" do
      remain = remain_fixture()
      assert {:ok, %Remain{}} = Admin.delete_remain(remain)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_remain!(remain.id) end
    end

    test "change_remain/1 returns a remain changeset" do
      remain = remain_fixture()
      assert %Ecto.Changeset{} = Admin.change_remain(remain)
    end
  end
end
