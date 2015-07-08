

class TempController < ApplicationController


  def index
    @temp = Temp.get_average(params[:query])
  end




end
