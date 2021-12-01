defmodule Relative do
  def count_larger([first | rest]) do
    Enum.reduce(rest, {first, 0}, fn reading, {last, count} ->
      if reading > last do
        {reading, count + 1}
      else
        {reading, count}
      end
    end) |> elem(1)
  end
end

readings = File.read!("input.txt") |> String.trim() |> String.split("\n") |> Enum.map(&String.to_integer/1)
count = Relative.count_larger(readings)
IO.puts "Found #{count} increasing readings"
