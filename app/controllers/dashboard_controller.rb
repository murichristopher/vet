class DashboardController < ApplicationController
  def index
    @service_queue_items = ServiceQueueItem.all.order(created_at: :desc)
  end

  def calendar; end
end
