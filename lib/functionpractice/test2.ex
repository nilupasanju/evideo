defmodule Canvas do
  require Logger
  @defaults [fg: "black", bg: "white", font: "Merriweather"]

  def draw_text(text, options \\ []) do
    options = Keyword.merge(@defaults, options)
    Logger.info("Drawing text #{inspect(text)}")
    options
  end
end

require Logger

defmodule HotelRoom do
  def book(%{name: name, height: height})
      when height > 1.9 do
    Logger.info("Need extra-long bed for #{name}")
  end

  def book(%{name: name, height: height})
      when height < 1.3 do
    Logger.info("Need low shower controls for #{name}")
  end

  def book(person) do
    Logger.info("Need regular bed for #{person.name}")
  end
end

defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end

defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee \\ %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts("Very cheap badge for #{name}")
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end

defmodule Users do
  dave = %{name: "Dave", state: "TX", likes: "Programming"}

  case dave do
    %{state: some_state} = person ->
      IO.puts("#{person.name} lives in #{some_state}")

    _ ->
      IO.puts("No matches")
  end
end
