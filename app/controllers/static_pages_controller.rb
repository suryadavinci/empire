class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @destinations = Destination.order(:name)
      @transport = Transport.new
      #@journey = Journey.new
      @journeys = []
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
