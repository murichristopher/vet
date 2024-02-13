# app/controllers/events_controller.rb
class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:create]

  # GET /events
  def index
    @events = Event.all
    render json: @events.as_json(only: %i[title start], rename: { start_time: :start })
  end

  # POST /events
  def create
    params['events'].each do |event|
      Event.new(title: event['title'], start: event['start']).save
    end

    head :ok
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.permit(:events)
  end
end
