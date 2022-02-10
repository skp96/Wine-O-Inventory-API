defmodule WineOInventoryApi.UsersTest do
    use WineOInventoryApi.DataCase

    alias WineOInventoryApi.Users

    describe "members" do
        alias WineOInventoryApi.Users.Member

        @valid_attrs %{name: "some name"}
        @invalid_attrs %{name: nil}

        test "create_member/1 with valid data returns a wine" do
            assert {:ok, %Member{} = member} = Users.create_member(@valid_attrs)
            assert member.name =="some name"
        end

        test "create_member/1 with invalid data returns an error changeset" do
            assert {:error, %Ecto.Changeset{}} = Users.create_member(@invalid_attrs)
        end

        test "list_all_member_wines/1 returns all user wines" do
            assert Users.list_all_member_wines("test") == []
        end
    end
end
