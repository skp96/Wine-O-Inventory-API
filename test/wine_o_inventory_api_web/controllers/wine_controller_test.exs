defmodule WineOInventoryApiWeb.WineControllerTest do
    use WineOInventoryApiWeb.ConnCase

    @create_attrs %{attributes: %{name: "some name", description: "some description", rating: 5, quantity: 10}} 
    @invalid_attrs %{attributes: %{name: nil, description: nil, rating: nil, quantity: nil}}

    describe "index" do
        test "list all wines", %{conn: conn} do
            conn = get(conn, Routes.wine_path(conn, :index))
            assert json_response(conn, 200) == []
        end
    end

    describe "create" do
        test "renders a newly created wine when data is valid ", %{conn: conn} do
            conn = post(conn, Routes.wine_path(conn, :create), data: @create_attrs)
            assert json_response(conn, 201)["data"]["attributes"] != %{}
        end

        test "renders an error when data is invalid", %{conn: conn} do
            conn = post(conn, Routes.wine_path(conn, :create), data: @invalid_attrs)
            assert json_response(conn, 422)["errors"] != {}
        end
    end
end
