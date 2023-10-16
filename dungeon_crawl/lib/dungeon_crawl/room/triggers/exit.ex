defmodule DungeonCrawl.Room.Triggers.Exit do
  @behaviour DungeonCrawl.Room.Trigger
  def run(character, _), do: {character, :exit}
end

# usamos @behaviour para decirle a elixir que el modulo exit sigue el contrato de Room.Trigger
