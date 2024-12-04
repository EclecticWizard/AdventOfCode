
defmodule DayOne do
  def run do
    case File.read("day1.txt") do
      {:ok, inputs} ->
        normalised = String.replace(inputs, "   ", "\t")
        lines = String.split(normalised, "\n", trim: true)
        list1 = Enum.map(lines, fn string -> String.split(string, "\t", trim: true)
          |> List.first()
        end)
        list2 = Enum.map(lines, fn string -> String.split(string, "\t", trim: true)
          |> List.last()
          end)
        list1 = Enum.sort(list1)
        list2 = Enum.sort(list2)
        list1 = Enum.map(list1, fn string -> String.to_integer(string) end)
        list2 = Enum.map(list2, fn string -> String.to_integer(string) end)
        IO.inspect(list1)
        IO.inspect(list2)

        distances = Enum.zip(list1, list2)
          |> Enum.map(fn {location1, location2} -> abs(location1 - location2) end)
        distance = Enum.sum(distances)
        IO.inspect(distance)

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end
end

DayOne.run


### Resources
# https://joyofelixir.com/11-files/
# https://elixirforum.com/t/looping-through-a-list/45241
# https://hexdocs.pm/elixir/Enum.html#sort/1
# https://hexdocs.pm/elixir/Enum.html#map/2
# https://hexdocs.pm/elixir/Enum.html#zip/1
# https://hexdocs.pm/elixir/Kernel.html#abs/1
# https://hexdocs.pm/elixir/String.html#to_integer/1
