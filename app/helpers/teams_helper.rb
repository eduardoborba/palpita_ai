module TeamsHelper
  def team_options_for_select
    options = Team.all.map do |team|
      [team.name, team.id]
    end

    options_for_select(options)
  end

  def team_option_content(team)
    image_tag(team.logo_url, width: 20) + " " + team.name
  end
end
