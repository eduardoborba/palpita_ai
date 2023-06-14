# frozen_string_literal: true

class HowItWorksController < ApplicationController
  before_action :authenticate_player!

  def index; end
end
