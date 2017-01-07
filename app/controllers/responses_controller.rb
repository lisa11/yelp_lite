class ResponsesController < ApplicationController
  def index
    @q = Response.ransack(params[:q])
    @responses = @q.result(:distinct => true).includes(:reviews, :owners).page(params[:page]).per(10)

    render("responses/index.html.erb")
  end

  def show
    @response = Response.find(params[:id])

    render("responses/show.html.erb")
  end

  def new
    @response = Response.new

    render("responses/new.html.erb")
  end

  def create
    @response = Response.new

    @response.reviews_id = params[:reviews_id]
    @response.owners_id = params[:owners_id]

    save_status = @response.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/responses/new", "/create_response"
        redirect_to("/responses")
      else
        redirect_back(:fallback_location => "/", :notice => "Response created successfully.")
      end
    else
      render("responses/new.html.erb")
    end
  end

  def edit
    @response = Response.find(params[:id])

    render("responses/edit.html.erb")
  end

  def update
    @response = Response.find(params[:id])

    @response.reviews_id = params[:reviews_id]
    @response.owners_id = params[:owners_id]

    save_status = @response.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/responses/#{@response.id}/edit", "/update_response"
        redirect_to("/responses/#{@response.id}", :notice => "Response updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Response updated successfully.")
      end
    else
      render("responses/edit.html.erb")
    end
  end

  def destroy
    @response = Response.find(params[:id])

    @response.destroy

    if URI(request.referer).path == "/responses/#{@response.id}"
      redirect_to("/", :notice => "Response deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Response deleted.")
    end
  end
end
