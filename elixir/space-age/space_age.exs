defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune
  @days_to_seconds 24 * 60 * 60

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    case planet do
      :earth -> seconds / to_earth_years(1)
      :mercury -> seconds / to_earth_years(0.2408467)
      :venus -> seconds / to_earth_years(0.61519726)
      :mars -> seconds / to_earth_years(1.8808158)
      :jupiter -> seconds / to_earth_years(11.862615)
      :saturn -> seconds / to_earth_years(29.447498)
      :uranus -> seconds / to_earth_years(84.016846)
      :neptune -> seconds / to_earth_years(164.79132)
      _ -> 1
    end
  end

  defp to_earth_years(year) do
    year * 365.25 * @days_to_seconds
  end
end
