defmodule CreateLists do
  def run do
    case File.read("day1.txt") do
      {:ok, inputs} ->
        normalised = String.replace(inputs, "   ", "\t")
        IO.inspect(normalised)
      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end
end

CreateLists.run


### Resources
# https://joyofelixir.com/11-files/
#
