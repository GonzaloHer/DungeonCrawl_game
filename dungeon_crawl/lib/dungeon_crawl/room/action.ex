defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action

  defstruct label: nil, id: nil

  def forward, do: %Action{id: :forward, label: "MOVE FORWARD."}
  def rest, do: %Action{id: :rest, label: "take a better look and rest."}
  def search, do: %Action{id: search, label: "Search the room."}
end
