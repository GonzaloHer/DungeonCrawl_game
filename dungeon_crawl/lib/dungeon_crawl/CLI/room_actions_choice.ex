defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  # al ser no tipado suponemos que lo que nos pasan es un room, entonces accedemos luego a las acciones de ese room.
  def start(room) do
    room_actions = room.actions
    Shell.info(room.description)
    chosen_action = ask_for_option(room_actions)
    # chosen_action =
    #   room_actions
    #   |> display_options
    #   |> generate_question
    #   |> Shell.prompt()
    #   |> parse_answer!
    #   |> find_option_by_index!(room_actions)

    {room, chosen_action}
  end
end
