# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def form_options
    {
      html: { fole: "form" },
      defaults: {
        input_html: { class: "form-control" }
      }
    }
  end

  def flash_notices
    raw([:notice, :error, :alert].collect {|type| content_tag('div', flash[type], :id => type) if flash[type] }.join)
  end

  # Render a submit button and cancel link
  def submit_or_cancel(cancel_url = session[:return_to] ? session[:return_to] : url_for(:action => 'index'), label = 'Save Changes', submit_html_options = {})
    raw(content_tag(:div, submit_tag(label, submit_html_options) + ' or ' +
      link_to('Cancel', cancel_url), :id => 'submit_or_cancel', :class => 'submit'))
  end
end
