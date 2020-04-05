module TeamsHelper
  def team_option_content(team)
    image_tag(team.logo_url, width: 20) + " " + team.name
  end
end
