defmodule TakeANumber do  
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(number) do
    receive do
        {:report_state, sender_pid} -> 
            send(sender_pid, number) 
            loop(number)

        {:take_a_number, sender_pid} -> 
            send(sender_pid, number+1) 
            loop(number+1)

        :stop -> nil

        _ -> loop(number)
    end
  end

end
