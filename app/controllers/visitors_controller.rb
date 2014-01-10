class VisitorsController < ApplicationController

  def new
    @topics = Topic.roots
    @new_topic = Topic.new
    @new_information = InformationLine.new
    @current_topic = (params[:current_topic].present? ? Topic.find(params[:current_topic]) : Topic.first)
  end

end
