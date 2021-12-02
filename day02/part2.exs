instructions =
  File.read!("input.txt")
  |> String.trim()
  |> String.split("\n")
  |> Enum.map(fn line ->
    [direction, magnitude] = String.split(line, " ")
    {direction, String.to_integer(magnitude)}
  end)


position =
  Enum.reduce(instructions, %{depth: 0, horizontal: 0, aim: 0}, fn
    {"up", magnitude}, position ->
      %{position | aim: position.aim - magnitude}
    {"down", magnitude}, position ->
      %{position | aim: position.aim + magnitude}
    {"forward", magnitude}, position ->
      horizontal = position.horizontal + magnitude
      depth = position.depth + (magnitude * position.aim)
      %{position | horizontal: horizontal, depth: depth}
  end)
  |> IO.inspect(label: "position")

product = position.depth * position.horizontal
IO.puts("Product: #{product}")
