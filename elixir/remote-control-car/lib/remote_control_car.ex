defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: d}) do
    "#{d} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: p}) do
    case p do
      0 -> "Battery empty"
      _ -> "Battery at #{p}%"
    end
  end

  def drive(%RemoteControlCar{battery_percentage: 0} = remote_car), do: remote_car

  def drive(%RemoteControlCar{battery_percentage: p, distance_driven_in_meters: d} = remote_car) do
    %{remote_car | battery_percentage: p - 1, distance_driven_in_meters: d + 20}
  end
end
