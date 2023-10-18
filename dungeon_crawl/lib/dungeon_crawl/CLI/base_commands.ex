defmodule DungeonCrawl.CLI.BaseCommands do
  # use Monad.Operators
  alias Mix.Shell.IO, as: Shell
  # import Monad.Result, only: [success: 1, success?: 1, error: 1, return: 1]

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} -> Shell.info("#{index} - #{option}") end)

    options
  end

  def generate_question(options) do
    # para cada uno de la lista hace: item1 , item2 ,.... (agrega comas entre medio)
    options = Enum.join(1..Enum.count(options), ",")
    # si hago interpolacion con una lista, esta se muestra entera, interpolada.
    "CHOSE wisely...! [#{options}]\n"
  end

  # def parse_answer!(answer) do
  #   case Integer.parse(answer) do
  #     :error -> error("Invalid option")
  #     {option, _} -> success(option - 1)
  #   end
  # end

  # def find_option_by_index!(index, options) do
  #   case Enum.at(options, index) do
  #     nil -> error("Invalid option")
  #     chosen_option -> success(chosen_option)
  #   end
  # end

  def ask_for_option(options) do
    answer =
      options
      |> display_options
      |> generate_question
      |> Shell.prompt()

    with {option, _} <- Integer.parse(answer),
         chosen when chosen != nil <- Enum.at(options, option - 1) do
      chosen
    else
      :error -> retry(options)
      nil -> retry(options)
    end
  end

  def retry(options) do
    display_error("Invalid option")
    ask_for_option(options)
  end

  def display_error(message) do
    Shell.cmd("clear")
    Shell.error(message)
    Shell.prompt("Press Enter to continue.")
    Shell.cmd("clear")
  end
end
