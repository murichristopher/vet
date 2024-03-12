class DashboardController < ApplicationController
  def index
    @service_queue_items = ServiceQueueItem.all.order(created_at: :desc)
  end

  def calendar; end
  def calendar2; end
end
