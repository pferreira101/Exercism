defmodule LogLevel do
  @trace :trace
  @debug :debug
  @info :info
  @warning :warning
  @error  :error
  @fatal :fatal
  @other :unknown

  @labels [@trace, @debug, @info, @warning, @error, @fatal]

  def to_label(level, legacy?) do
    cond do
      legacy? && (level == 0 || level == 5 ) -> @other
      level >= 0 && level < 6 -> Enum.at(@labels, level)
      true -> @other           
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
        label == @fatal || label == @error -> :ops
        label == @other && legacy? -> :dev1
        label == @other -> :dev2
        true -> false
      end
  end
end
