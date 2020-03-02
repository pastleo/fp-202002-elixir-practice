defmodule FpPractice do
  def student_staff_name_group(classes) do
    classes
    |> Enum.flat_map(&class_persons/1)
    |> Enum.map(&put_full_name/1)
    |> Enum.filter(&is_adult?/1)
    |> Enum.group_by(&staff_student/1)
    |> Enum.map(&group_by_firstnames/1)
    |> Map.new()
  end

  defp class_persons(class) do
    Enum.filter(class, &valid_role?/1)
    |> Enum.flat_map(&put_role/1)
  end

  defp valid_role?({:teacher, _}), do: true
  defp valid_role?({:assistants, _}), do: true
  defp valid_role?({:students, _}), do: true
  defp valid_role?(_), do: false

  defp put_role({role, persons}) do
    List.wrap(persons)
    |> Enum.filter(&is_map/1)
    |> Enum.map(&Map.put(&1, :role, role))
  end

  defp put_role(_), do: []

  defp put_full_name(person = %{first_name: first_name, last_name: last_name}) do
    Map.put(person, :full_name, "#{first_name} #{last_name}")
  end

  defp is_adult?(%{age: age}) do
    age >= 30
  end

  defp staff_student(%{role: :teacher}), do: :staff
  defp staff_student(%{role: :assistants}), do: :staff
  defp staff_student(%{role: :students}), do: :students

  defp group_by_firstnames({st, persons}) do
    Enum.group_by(persons, &Map.get(&1, :first_name))
    |> Enum.map(&get_full_names/1)
    |> Map.new()
    |> (&{st, &1}).()
  end

  defp get_full_names({first_name, persons}) do
    Enum.map(persons, &Map.get(&1, :full_name))
    |> (&{first_name, &1}).()
  end

  def test_classes do
    [
      %{
        name: "1A",
        teacher: %{
          age: 28,
          first_name: "Tricia",
          last_name: "Garrett"
        },
        assistants: %{
          age: 38,
          first_name: "Liliana",
          last_name: "Kidd"
        },
        students: [
          %{
            age: 46,
            first_name: "Luz",
            last_name: "Casey"
          },
          %{
            age: 38,
            first_name: "Rosemary",
            last_name: "Barber"
          }
        ]
      },
      %{
        name: "1B",
        teacher: %{
          age: 43,
          first_name: "Ollie",
          last_name: "Matthews"
        },
        assistants: nil,
        students: [
          %{
            age: 45,
            first_name: "Ollie",
            last_name: "Sandoval"
          },
          %{
            age: 27,
            first_name: "Gale",
            last_name: "Coleman"
          }
        ]
      },
      %{
        name: "2A",
        teacher: %{
          age: 49,
          first_name: "Liza",
          last_name: "Vega"
        },
        assistants: %{
          age: 48,
          first_name: "Tricia",
          last_name: "Brewer"
        },
        students: [
          %{
            age: 24,
            first_name: "Ophelia",
            last_name: "Roy"
          },
          %{
            age: 40,
            first_name: "Ophelia",
            last_name: "Sears"
          },
          %{
            age: 37,
            first_name: "Gale",
            last_name: "Strong"
          }
        ]
      },
      %{
        name: "2B",
        teacher: %{
          age: 24,
          first_name: "Rochelle",
          last_name: "Wilcox"
        },
        assistants: [
          %{
            age: 32,
            first_name: "Gale",
            last_name: "Christensen"
          },
          %{
            age: 46,
            first_name: "Luz",
            last_name: "Crawford"
          },
          %{
            age: 38,
            first_name: "Rosemary",
            last_name: "Casey"
          }
        ],
        students: [
          %{
            age: 42,
            first_name: "Gale",
            last_name: "Joseph"
          },
          %{
            age: 38,
            first_name: "Ophelia",
            last_name: "Crawford"
          },
          %{
            age: 45,
            first_name: "Gale",
            last_name: "Bowers"
          }
        ]
      }
    ]
  end
end
