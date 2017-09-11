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


    def link_to_function(name, *args, &block)
       html_options = args.extract_options!.symbolize_keys

       function = block_given? ? update_page(&block) : args[0] || ''
       onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
       href = html_options[:href] || '#'

       content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
    end


    def link_to_remove_fields(name, f)
      f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
    end

    def link_to_add_fields(name, f, association)
      new_object = f.object.class.reflect_on_association(association).klass.new
      fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
        render("shared/"+association.to_s.singularize + "_form", :f => builder)
      end
      link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
    end


end
