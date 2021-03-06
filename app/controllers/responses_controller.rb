class ResponsesController < ApplicationController
  
  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.order("created_at DESC")

    respond_to do |format|
      format.html { render layout: false } # index.html.erb
      format.json { render json: @responses }
    end
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    @response = Response.find(params[:id])

    respond_to do |format|
      format.html { render layout: false } # show.html.erb
      format.json { render json: @response }
    end
  end

  # GET /responses/new
  # GET /responses/new.json
  def new
    @response = Response.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response }
    end
  end
  
  def public_new
    @response = Response.new
    
    respond_to do |format|
      format.html # public_new.html.erb
    end
  end

  # GET /responses/1/edit
  def edit
    @response = Response.find(params[:id])
  end
  
  # POST /responses/ajax_create
  def ajax_create
    @response = Response.new(params[:response])
    
    if @response.empty?
      render :partial => "results_default"
    else
      top, almost = Item.rank_all(@response).slice(0, 2)
      if (top.import_price.to_f < almost.import_price.to_f)
        @hardcore = almost
        @recommended = top
      else
        @hardcore = top
        @recommended = almost
      end

      # @response.save
      render :partial => "results"
    end
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(params[:response])

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created.' }
        format.json { render json: @response, status: :created, location: @response }
      else
        format.html { render action: "new" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /responses/1
  # PUT /responses/1.json
  def update
    @response = Response.find(params[:id])

    respond_to do |format|
      if @response.update_attributes(params[:response])
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to responses_url }
      format.json { head :ok }
    end
  end
end
