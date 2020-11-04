module ApplicationHelper
  def navlink(title, path, current_controller, current_action)
    css_klass = ''
    if params[:controller] == current_controller.to_s && current_action.include?(params[:action].to_sym)
      css_klass = 'active'
    end
    tag.li class: css_klass do
      link_to title, path, class: 'text-muted'
    end
  end

  # 選択中のサイドメニューのクラスを返す
  def sidebar_activate(sidebar_link_url)
    current_url = request.headers['PATH_INFO']
    if current_url.match(sidebar_link_url)
      ' class="active"'
    else
      ''
    end
  end

  # サイドメニューの項目を出力する
  # rubocop:disable Rails/OutputSafety
  def sidebar_list_items
    items = [
      { text: '野菜', path: dashboard_vegetables_path },
      { text: '企業', path: dashboard_companies_path }
    ]

    html = ''
    items.each do |item|
      text = item[:text]
      path = item[:path]
      html += %(<li#{sidebar_activate(path)}><a href="#{path}">#{text}</a></li>)
    end

    raw(html)
  end
  # rubocop:enable Rails/OutputSafety
end
