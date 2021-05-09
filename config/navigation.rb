# -*- coding: utf-8 -*-
SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'selected active'
  navigation.active_leaf_class = 'active'
  navigation.items do |primary|
    li_class = 'v-btn ripple'
    search_class = "search_save"
    about_class = request.url == root_url ? "selected active" : ""

    # puts "params[:search] #{params[:search]}"
    s_params = {}
    s_params[:search] = params[:search] if params[:search].present?

    primary.item :about, 'О нас', root_path
    primary.item :team, 'Наша команда', team_path
    primary.item :projects, 'Проекты'
    primary.item :cost, 'Стоимость'
    primary.item :contacts, 'Контакты'

    primary.dom_class = 'nav'
  end
end

