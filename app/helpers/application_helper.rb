module ApplicationHelper

  def hashids_encode(text)
    hashids = Hashids.new(ENV['hashids_salt'].to_s)
    hashids.encode(text)
  end

  def hashids_decode(text)
    hashids = Hashids.new(ENV['hashids_salt'].to_s)
    hashids.decode(text)
  end

  def markdown(text)
    options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" },
        space_after_headers: true,
        fenced_code_blocks: true
    }

    extensions = {
        autolink:           true,
        superscript:        true,
        disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def user_has_address?
    if user_signed_in?
      if current_user.address == nil
        edit_user_registration_path
      else

      end
    end
  end

  def bootstrap_class_for flash_type
    case flash_type
      when 'success'
        "alert-success"
      when 'error'
        "alert-error"
      when 'alert'
        "alert-warning"
      when 'notice'
        "alert-info"
      else
        "alert-info"
    end
  end

end
