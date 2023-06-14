# frozen_string_literal: true

class ImportTeamsJob < ApplicationJob
  FILEPATH = Rails.root.join('vendor', 'teams_data.xml')

  def perform
    teams_data_xml.xpath('//C').each do |team|
      next if Team.exists?(name: team['n'])

      Team.create!(
        name: team['n'],
        logo_url: team['i']
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
