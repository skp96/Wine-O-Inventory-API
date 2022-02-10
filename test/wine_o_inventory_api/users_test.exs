defmodule WineOInventoryApi.UsersTest do
    use WineOInventoryApi.DataCase

    alias WineOInventoryApi.Users

    import WineOInventoryApi.UsersFixtures

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

        test "list_all_member_wines/1 returns all member wines" do
            create_member_with_assoc_fixture()
            assert Users.list_all_member_wines("some member") == [
                %{
                    member: "some member",
                    wine_name: "some wine",
                    wine_description: "some description",
                    wine_rating: 5,
                    wine_quantity: 10,
                    store_name: "some store",
                    store_location: nil,
                    winery_name: "some winery",
                    winery_location: nil,
                }
            ]
        end

        test "list_all_member_wines/1 returns an empty list when member is not found " do
            assert Users.list_all_member_wines("some member") == []
        end

        test "list_member_wines_from_winery/2 returns all wines from a specific winery" do
            create_member_with_assoc_fixture()
            assert Users.list_member_wines_from_winery("some member", "some winery") == [
                %{
                    name: "some member",
                    wine: "some wine"
                }
            ]
        end

        test "list_member_wines_from_winery/2 returns empty list when member is not found" do
            assert Users.list_member_wines_from_winery("some member", "some winery") == []
        end

        test "list_member_wines_from_winery/2 returns empty list when winery is not found" do
            create_member_with_assoc_fixture()
            assert Users.list_member_wines_from_winery("some member", "some other winery") == []
        end
    end
end
