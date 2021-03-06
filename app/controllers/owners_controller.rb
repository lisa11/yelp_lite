class OwnersController < ApplicationController
  def index
    @q = Owner.ransack(params[:q])
    @owners = @q.result(:distinct => true).includes(:restaurants, :accounts, :responses, :reviews).page(params[:page]).per(10)

    render("owners/index.html.erb")
  end

  def show
    @response = Response.new
    @owner = Owner.find(params[:id])

    render("owners/show.html.erb")
  end

  def new
    @owner = Owner.new

    render("owners/new.html.erb")
  end

  def create
    @owner = Owner.new

    @owner.restaurants_id = params[:restaurants_id]
    @owner.accounts_id = params[:accounts_id]

    save_status = @owner.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/owners/new", "/create_owner"
        redirect_to("/owners")
      else
        redirect_back(:fallback_location => "/", :notice => "Owner created successfully.")
      end
    else
      render("owners/new.html.erb")
    end
  end

  def edit
    @owner = Owner.find(params[:id])

    render("owners/edit.html.erb")
  end

  def update
    @owner = Owner.find(params[:id])

    @owner.restaurants_id = params[:restaurants_id]
    @owner.accounts_id = params[:accounts_id]

    save_status = @owner.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/owners/#{@owner.id}/edit", "/update_owner"
        redirect_to("/owners/#{@owner.id}", :notice => "Owner updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Owner updated successfully.")
      end
    else
      render("owners/edit.html.erb")
    end
  end

  def destroy
    @owner = Owner.find(params[:id])

    @owner.destroy

    if URI(request.referer).path == "/owners/#{@owner.id}"
      redirect_to("/", :notice => "Owner deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Owner deleted.")
    end
  end
end
