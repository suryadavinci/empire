module ApplicationHelper
  def full_title(page_title = '')
    base_title= 'Empire Bus'
    if(page_title.empty?)
      base_title
    else
      page_title+' | '+base_title
    end
  end

  def max_seats(journey)
    max_seats = journey.bus.max_seats
  end

  def free_seats(journey, max)
    free_seats = max - Booking.where(journey_id: journey.id).sum(:seats_count)
  end

  def format_datetime(datetime)
    datetime.strftime('%a, %d-%b-%Y %H:%M %p')
  end
end
