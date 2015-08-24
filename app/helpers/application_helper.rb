module ApplicationHelper

  def error_messages_for(object)
    render 'layouts/error_messages_for', object: object
  end

  def selectify(arr)
    res=[]
    for i in 0...arr.size
      res << [arr[i],i]
    end
    res
  end

  def link_to_back
  link_to(fa_icon("angle-left")+' Назад',:back, class: 'btn btn-default')
  end

  #   для вывода текста с использованием markdown разметки
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
    # return markdown.render(text)
  end
end
