class ItypesController < ApplicationController
  # GET /itypes
  # GET /itypes.json
  def index
    @itypes = Itype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @itypes }
    end
  end

  # GET /itypes/1
  # GET /itypes/1.json
  def show
    @itype = Itype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @itype }
    end
  end

  # GET /itypes/new
  # GET /itypes/new.json
  def new
    @itype = Itype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @itype }
    end
  end

  # GET /itypes/1/edit
  def edit
    @itype = Itype.find(params[:id])
  end

  # POST /itypes
  # POST /itypes.json
  def create
    @itype = Itype.new(params[:itype])

    respond_to do |format|
      if @itype.save
        format.html { redirect_to @itype, notice: 'Itype was successfully created.' }
        format.json { render json: @itype, status: :created, location: @itype }
      else
        format.html { render action: "new" }
        format.json { render json: @itype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /itypes/1
  # PUT /itypes/1.json
  def update
    @itype = Itype.find(params[:id])

    respond_to do |format|
      if @itype.update_attributes(params[:itype])
        format.html { redirect_to @itype, notice: 'Itype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @itype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itypes/1
  # DELETE /itypes/1.json
  def destroy
    @itype = Itype.find(params[:id])
    @itype.destroy

    respond_to do |format|
      format.html { redirect_to itypes_url }
      format.json { head :no_content }
    end
  end
end
