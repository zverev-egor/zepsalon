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
  class HTMLwithPygments < Redcarpet::Render::HTML
    require 'pygments.rb'
    def block_code(code, language)
      Pygments.highlight(code, :lexer => language)
    end
  end

  def markdown(text, options = {})
    renderer = HTMLwithPygments.new(hard_wrap: true)
    options={
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true,
        underline: true,
        highlight: true,
        quote: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end
