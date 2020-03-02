defmodule FpPracticeTest do
  use ExUnit.Case
  doctest FpPractice

  test "convert classes to group of first names and staff/student" do
    assert FpPractice.student_staff_name_group(FpPractice.test_classes()) == %{
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
               "Ophelia" => ["Ophelia Sears", "Ophelia Crawford"],
               "Rosemary" => ["Rosemary Barber"]
             }
           }
  end
end
