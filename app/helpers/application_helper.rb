module ApplicationHelper
  CONTENT_PATHS = {
    dashboard: 'dashboard/content',
    landing_page: 'landing_page/content'
  }.freeze
  private_constant :CONTENT_PATHS

  def user_authentication_content
    if user_signed_in?
      CONTENT_PATHS[:dashboard]
    else
      CONTENT_PATHS[:landing_page]
    end
  end
end
