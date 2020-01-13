module DashboardHelpers
  def fill_places(arr, dashboard, symbol)
    arr.each { |item| dashboard.add_move(item, symbol) }
  end
end