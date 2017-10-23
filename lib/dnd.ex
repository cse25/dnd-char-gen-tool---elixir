defmodule Dnd do
  def main(input) do
    input
    |> generate_character
    |> roll_stats
  end

  def roll_stats(%Dnd.Character{name: name} = character) do
    rolled_stats = Enum.map [1,1,1,1,1,1,1], fn(x) ->
      roll_3d6() * x
    end

    sorted_stats = Enum.sort(rolled_stats)
    [_head | tail] = sorted_stats
    total = Enum.reduce sorted_stats, fn(stat, acc) ->
      stat + acc
    end
    %Dnd.Character{character | stat_rolls: tail, total: total}
  end

  def roll_3d6() do
    roll_1d6() + roll_1d6() + roll_1d6()
  end

  def roll_1d6() do
    Enum.random(1..6)
  end

  def generate_character(name) do
    %Dnd.Character{name: name}
  end
end
