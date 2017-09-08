module ApplicationHelper
  def full_title(page_title = '')
    base_title= 'Empire Bus'
    if(page_title.empty?)
      base_title
    else
      page_title+' | '+base_title
    end
  end

  def max_seats(transport)
    max_seats = transport.bus.max_seats
  end

  def free_seats(transport, max)
    free_seats = max - Booking.where(transport_id: transport.id).sum(:seats_count)
  end

  def format_datetime(datetime)
    datetime.strftime('%a, %d-%b %H:%M %p')
  end

  def format_time(time)
    time.strftime("%I:%M %p")
  end

  def format_date(date)

    date=Date.parse(date.to_s)
    date.strftime("%a, %d-%b-%Y")
  end

  def passenger_details(booking)
    booking.seats_count - booking.passengers.count
  end


  def recurrence(transport)
    case transport.recurrence
      when 1
        "Daily"
      when 0
        "One-Time"
      else
          "-"
    end
  end
end
