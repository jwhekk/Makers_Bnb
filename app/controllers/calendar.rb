require 'date'
module Calendar_helpers
  MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July',
            'August', 'September', 'October', 'November', 'December']
  def create_calendar
    SpaceCalendar.create(year: '2016',
                          availability: statuses,
                          space: @space)

  end

  def statuses
    @status = ''
    366.times { @status  += "b"}
    @status
  end

  def update_calendar(start_date,end_date)
    test_calendar = SpaceCalendar.last
    date_start = split_date(start_date)
    date_end = split_date(end_date)
    # from_date = Date.new(date_start[0].to_i, date_start[1].to_i,date_start[2].to_i)
    # to_date = Date.new(date_end[0].to_i,date_end[1].to_i,date_end[2].to_i)
    # year_day1 = from_date.yday
    # year_day2 = to_date.yday
    # days = year_day2 - year_day1
    days_and_start = calculate_days(date_start,date_end)[1]
    days = days_and_start[0]
    start = days_and_start[1] - 1
    days.times do
      test_calendar.availability[start] = 'c'
      start += 1
    end
    test_calendar.save
  end

  def prepare_calendar(date, space)
    date_calendar = Date.parse(date)
    p date_calendar
    calendars = space.space_calendars
    test_calendar = calendars.first
    month_name = date_calendar.strftime("%B")
    number_of_days = date_calendar.next_month.yday - date_calendar.yday
    days = []
    week_day = calculate_week_day(date)
    week_day = date_calendar.wday
    availability = test_calendar.availability[date_calendar.yday,(number_of_days+1)]
    week_day.times { days << [0,'z']}
    number = 1
    number_of_days.times do
      days << [number,availability[number]]
      number += 1
    end
    end_blanks = 7 - (week_day + number_of_days)%7
    end_blanks.times { days << [0,'z']}
    calendar = []
    calendar[0] = date_calendar.year.to_s
    calendar[1] = month_name
    calendar[2] = days
    return calendar
  end

  def split_date(date)
    year = date[0,4]
    month = date[5,2]
    day = date[8,2]
    date_array = [year,month,day]
  end

  def calculate_days(start_date,end_date)
    date_obj1 = Date.new(start_date[0].to_i, start_date[1].to_i, start_date[2].to_i)
    date_obj2 = Date.new(end_date[0].to_i, end_date[1].to_i, end_date[2].to_i)
    year_day1 = date_obj1.yday
    year_day2 = date_obj2.yday
    days = year_day2 - year_day1
    result = [days, year_day1]
  end
  def calculate_week_day(date)
    week_date = split_date(date)
    date_obj = Date.new(week_date[0].to_i, week_date[1].to_i, week_date[2].to_i)
    week_day = date_obj.wday
  end
end
