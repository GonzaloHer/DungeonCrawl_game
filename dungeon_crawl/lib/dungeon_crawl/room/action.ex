defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action

  defstruct label: nil, id: nil

  @type t :: %Action{id: atom, label: String.t()}

  def forward, do: %Action{id: :forward, label: "MOVE FORWARD."}
  def rest, do: %Action{id: :rest, label: "take a better look and rest."}
  def search, do: %Action{id: search, label: "Search the room."}

  defimpl String.Chars do
    def to_string(action), do: action.label
  end

  # aca no hay que usar el for para especificar, porque estamo dentro del modulo.
end
