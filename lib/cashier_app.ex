defmodule CashierApp do
  def total(items) do
    grouped = Enum.frequencies(items)

    Enum.reduce(grouped, 0.0, fn {code, count}, acc ->
      acc + apply_pricing_rule(code, count)
    end)
    |> Float.round(2)
  end

  defp apply_pricing_rule("GR1", count), do: Float.round(div(count + 1, 2) * 3.11, 2)
  defp apply_pricing_rule("SR1", count) when count >= 3, do: Float.round(count * 4.50, 2)
  defp apply_pricing_rule("SR1", count), do: Float.round(count * 5.00, 2)
  defp apply_pricing_rule("CF1", count) when count >= 3, do: Float.round(count * (11.23 * 2 / 3), 2)
  defp apply_pricing_rule("CF1", count), do: Float.round(count * 11.23, 2)
  defp apply_pricing_rule(_, _), do: 0.0
end
