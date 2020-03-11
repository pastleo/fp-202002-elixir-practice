defmodule FpPracticeTest do
  use ExUnit.Case
  doctest FpPractice

  defp sort_names(names_group) do
    names_group
    |> map_values(fn first_names ->
      map_values(first_names, &Enum.sort/1)
    end)
  end

  defp map_values(map, func) when is_map(map) do
    map
    |> Enum.map(fn {k, v} -> {k, func.(v)} end)
    |> Enum.into(%{})
  end
  defp map_values(any, _), do: any

  test "convert classes to group of first names and staff/student" do
    result =
      FpPractice.test_classes()
      |> FpPractice.student_staff_name_group()
      |> sort_names()

    expected = sort_names(
      %{
        staff: %{
          "Gale" => ["Gale Christensen"],
          "Liliana" => ["Liliana Kidd"],
          "Liza" => ["Liza Vega"],
          "Luz" => ["Luz Crawford"],
          "Ollie" => ["Ollie Matthews"],
          "Rosemary" => ["Rosemary Casey"],
          "Tricia" => ["Tricia Brewer"]
        },
        students: %{
          "Gale" => ["Gale Strong", "Gale Joseph", "Gale Bowers"],
          "Luz" => ["Luz Casey"],
          "Ollie" => ["Ollie Sandoval"],
          "Ophelia" => ["Ophelia Crawford", "Ophelia Sears"],
          "Rosemary" => ["Rosemary Barber"]
        }
      }
    )

    assert result == expected
  end
end
