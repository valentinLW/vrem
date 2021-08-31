class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @disable_header = true
  end

  def devise
    @disable_header = true
  end
end
