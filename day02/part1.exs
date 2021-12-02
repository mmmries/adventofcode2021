instructions =
  File.read!("input.txt")
  |> String.trim()
  |> String.split("\n")
  |> Enum.map(fn line ->
    [direction, magnitude] = String.split(line, " ")
    {direction, String.to_integer(magnitude)}
  end)


position =
  Enum.reduce(instructions, %{depth: 0, horizontal: 0}, fn
    {"up", magnitude}, position ->
      %{position | depth: position.depth - magnitude}
    {"down", magnitude}, position ->
      %{position | depth: position.depth + magnitude}
    {"forward", magnitude}, position ->
      %{position | horizontal: position.horizontal + magnitude}
  end)
  |> IO.inspect(label: "position")

product = position.depth * position.horizontal
IO.puts("Product: #{product}")
