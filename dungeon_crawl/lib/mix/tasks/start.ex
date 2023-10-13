defmodule Mix.Tasks.Start do
  use Mix.Task #usar Mix.task me permite crear tareas personalizadas, en este caso estoy creando la tarea para correr el programa con Mx start

  def run(_), do: DungeonCrawl.CLI.Main.start_game
end
