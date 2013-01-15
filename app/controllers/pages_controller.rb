require 'open-uri'

class PagesController < ApplicationController

  def index
    @programs = JSON.parse(
      open('http://www.kanal5play.se/api/getMobileFindProgramsContent').read)
    @programs = @programs['programsWithTemperatures']

    @programs.sort! { |a, b| b['temperature'] <=> a['temperature'] }
  end
end
