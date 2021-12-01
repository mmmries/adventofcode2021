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

  def triplet_windows(readings) do
    Enum.chunk_every(readings, 3, 1)
  end
end

readings = File.read!("input.txt") |> String.trim() |> String.split("\n") |> Enum.map(&String.to_integer/1)
count = Relative.triplet_windows(readings) |> Enum.map(&Enum.sum/1) |> Relative.count_larger()
IO.puts "Found #{count} increasing readings"
