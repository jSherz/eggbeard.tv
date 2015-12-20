module StatsHelper
  def format_stat(value)
    number_with_precision(value, precision: 0, delimiter: ',')
  end

  def render_stat(value, &description)
    render partial: 'stat_number', locals: { value: value, description: capture(&description) }
  end
end
