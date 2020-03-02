Functional Programming practice in Elixir (for 202002 lesson)
===

A practice that implements `FpPractice.student_staff_name_group` converting from:

```elixir
[
  %{
    name: "1A",
    teacher: %{first_name: "John", last_name: "Doe", age: 33},
    assistants: nil,
    students: []
  },
  %{
    name: "1B",
    teacher: nil,
    assistants: [%{first_name: "John", last_name: "Levis", age: 32}],
    students: [
      %{first_name: "John", last_name: "Ive", age: 31},
      %{first_name: "Tricia", last_name: "Garrett", age: 28},
    ]
  }
]
```

to (you need to remove persons that age is less than 30):

```elixir
%{
  staff: %{
    "John" => ["John Doe", "John Levis"]
  },
  students: %{
    "John" => ["John Ive"]
  }
}
```

## Get started

### Install Elixir

https://taian.su/2019-06-13-elixir-env/

### Git clone this project

```
$ git clone https://github.com/pastleo/fp-202002-elixir-practice.git
$ cd fp-202002-elixir-practice
```

### Use interactive elixir to run code

```
$ iex -S mix

iex(1)> FpPractice.student_staff_name_group(FpPractice.test_classes)
... your code's output value
```

### Start programming

use vscode or any editor to open `lib/fp_practice.ex` and implement `FpPractice.student_staff_name_group`

> Tip: in `iex`, you can enter `r FpPractice` to re-compile then `FpPractice.student_staff_name_group(FpPractice.test_classes)` will run newly saved code

### Verify your code

```
$ mix test
```

> testing result can be found in `test/fp_practice_test.exs`

if your code works correctly, you will see something like this:

```
.

Finished in 0.04 seconds
1 test, 0 failures
```

### Happy hacking!
