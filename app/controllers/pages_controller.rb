class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @project = Project.new
    @projects = Project.all
    @role = Role.new
  end
end
