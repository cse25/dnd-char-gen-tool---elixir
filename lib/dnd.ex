defmodule Dnd do
  def main(input) do
    input
    |> generate_character
    |> roll_stats
    |> assign_rolls
  end

  def assign_rolls(%Dnd.Character{stat_rolls: stat_rolls, skills: skills, name: name, total: total} = character) do
    IO.puts name
    IO.puts total
    IO.inspect stat_rolls, charlists: :as_lists
    for number <- stat_rolls do
      IO.puts skills
      IO.puts "Character: #{name}"
      IO.puts "Current Stat Value: #{number}"
      IO.gets "Input index of stat you wish you assign current value to:"
    end
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
