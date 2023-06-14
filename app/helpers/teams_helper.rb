# frozen_string_literal: true

module TeamsHelper
  def team_options_for_select(selected)
    options = Team.active.order(name: :asc).map do |team|
      [team.name, team.id, { 'data-content' => team_option_content(team).html_safe }]
    end

    options_for_select(options, selected)
  end

  def team_option_content(team)
    "#{image_tag(team.logo_url, width: 20)} #{team.name}"
  end
end
