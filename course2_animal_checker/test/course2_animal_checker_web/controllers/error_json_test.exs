defmodule Course2AnimalCheckerWeb.ErrorJSONTest do
  use Course2AnimalCheckerWeb.ConnCase, async: true

  test "renders 404" do
    assert Course2AnimalCheckerWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Course2AnimalCheckerWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
