class EventsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index

  end

  def show_user_events
    @event = Event.where(user_id: current_user.id)
  end

  def show
    @slug = params[:event_slug]
    @event = Wedding.where(slug: @slug)[0]
    @formatted_address = Geocoder.search("#{@event.latitude}, #{@event.longitude}")[0].formatted_address
    @receptions = @event.receptions
    @description = view_context.markdown(@event.description.to_s)
    render 'wedding_show'
  end


  def wedding_new
    @wedding = Wedding.new
  end
  def wedding_rsvp_to
    @rsvp = Rsvp.new
    @user = current_user
  end

  def rsvp_new

    receptions = params[:rsvpd]

    receptions.each do |reception|
      user = current_user.id
      reception = view_context.hashids_decode(reception).to_i
      Rsvp.create(user_id: user, reception_id: reception, party_size: 1)
    end

    redirect_to root_path

  end

end
