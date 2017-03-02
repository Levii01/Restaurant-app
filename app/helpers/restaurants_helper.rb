module RestaurantsHelper
  def shortest_timme(full_time)
    full_time.strftime("%R") if full_time
  end

  def week_days
    Restaurant::DAYS
  end
end
