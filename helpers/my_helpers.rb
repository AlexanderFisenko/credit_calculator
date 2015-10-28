# Additional helpers
module MyHelpers
  def rate_in_percents(float)
    float * 100
  end

  def round_and_format(float)
    if float.round(2).to_s.split('.').last == '0'
      return format('%.2f', float.abs)
    end

    float.round(2)
    # format('%g', (float.round(2)))
  end
end
