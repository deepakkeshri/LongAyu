class Api::V1::SearchController < ApplicationController
  def index
    if params[:search]
      labs=Service.search(params[:search])
      @query = params[:search]
    else
      labs=[]
    end
    if labs !=[]
      render :json => {:result=> "Success", :labs => labs}
    else
      render :json => {:result=> "Search Failed"}
    end
  end
end
