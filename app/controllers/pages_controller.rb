class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :terms, :about]
  def home
  end

  def about
  end
  def terms
  end

end
