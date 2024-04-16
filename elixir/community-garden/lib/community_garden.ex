# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start() do
    Agent.start(fn -> %{plots: [], index: 0} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn %{plots: plots, index: _} -> plots end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{plots: plots, index: i} ->
      index = i + 1
      plot = %Plot{plot_id: index, registered_to: register_to}
      {plot, %{plots: [plot | plots], index: index}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn %{plots: plots, index: i} ->
      %{plots: for(plot <- plots, plot.plot_id != plot_id, do: plot), index: i}
    end)
  end

  def get_registration(pid, plot_id) do
    registrations = list_registrations(pid)

    case for(registration <- registrations, registration.plot_id == plot_id, do: registration) do
      [] -> {:not_found, "plot is unregistered"}
      [plot] -> plot
    end
  end
end
