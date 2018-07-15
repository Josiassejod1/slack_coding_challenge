class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token
  def message
    @service = SlackMessageService.new(params)
    puts @service.service_provider
    render :text => @service.service_provider
  end
end
