require 'csv'

class UpdateTeamsJob < ApplicationJob
  FILEPATH = Rails.root.join('vendor', 'teams.csv')

  def perform
    CSV.foreach(FILEPATH, headers: true) do |team_data|
      team = Team.find(team_data['id'])

      next if team.blank?

      team.update!(
        name: team_data['name'],
        country: team_data['country'],
        active: team_data['active'] == '1'
      )
    end
  end

  private

  def teams_data_xml
    @teams_data_xml ||= Nokogiri::XML(file)
  end

  def file
    @file ||= File.read(FILEPATH)
  end
end
