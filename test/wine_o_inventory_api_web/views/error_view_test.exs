defmodule WineOInventoryApiWeb.ErrorViewTest do
  use WineOInventoryApiWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  import WineOInventoryApi.ProductsFixtures

  @invalid_attrs %{name: nil, description: nil, quantity: nil, rating: nil}

  test "renders 404.json" do
    assert render(WineOInventoryApiWeb.ErrorView, "404.json", []) == %{
             errors: %{detail: "Resource Not Found"}
           }
  end

  test "renders 500.json" do
    assert render(WineOInventoryApiWeb.ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end

  test "renders 500.html" do
    assert render(WineOInventoryApiWeb.ErrorView, "500.html", []) == "Server internal error"
  end

  test "renders 422.json" do
    changeset = changeset_fixture(@invalid_attrs)
    result_of_render = render(WineOInventoryApiWeb.ErrorView, "422.json", changeset: changeset)

    expectation = %{
      errors: %{
        description: ["can't be blank"],
        name: ["can't be blank"],
        quantity: ["can't be blank"],
        rating: ["can't be blank"]
      }
    }

    assert expectation == result_of_render
  end
end
