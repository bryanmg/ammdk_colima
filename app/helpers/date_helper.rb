module DateHelper
  def utc_to_localtime(datetime)
    datetime.localtime.strftime('%Y-%m-%d %H:%M')
  end
end
