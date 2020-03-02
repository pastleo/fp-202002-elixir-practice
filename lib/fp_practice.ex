defmodule FpPractice do
  def student_staff_name_group(classes) do
    # TODO: implement algorithm that convert from:
    #
    # [
    #   %{
    #     name: "1A",
    #     teacher: %{first_name: "John", last_name: "Doe", age: 33},
    #     assistants: nil,
    #     students: []
    #   },
    #   %{
    #     name: "1B",
    #     teacher: nil,
    #     assistants: [%{first_name: "John", last_name: "Levis", age: 32}],
    #     students: [
    #       %{first_name: "John", last_name: "Ive", age: 31},
    #       %{first_name: "Tricia", last_name: "Garrett", age: 28},
    #     ]
    #   }
    # ]
    #
    # to (you need to remove persons that age is less than 30):
    #
    # %{
    #   staff: %{
    #     "John" => ["John Doe", "John Levis"]
    #   },
    #   students: %{
    #     "John" => ["John Ive"]
    #   }
    # }
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
