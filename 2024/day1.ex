defmodule CreateLists do
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
        IO.inspect(list1)
        IO.inspect(list2)
      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end
end

CreateLists.run


### Resources
# https://joyofelixir.com/11-files/
# https://elixirforum.com/t/looping-through-a-list/45241
# https://hexdocs.pm/elixir/Enum.html#map/2
