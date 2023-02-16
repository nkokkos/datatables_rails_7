class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: UsersDatatable.new(view_context) }
      
      # Debug statements 
      # puts params.slice(:order).permit!.to_h.dig('order','0','column').to_i
      # puts params.slice(:order).permit!.to_h.dig('order','0','dir').to_s 
      # order parameter from datatables looks like this:
      # "order"=>{"0"=>{"column"=>"0", "dir"=>"asc"}},
      #
      # ActionController::UnfilteredParameters (unable to convert unpermitted parameters to hash)
      # puts params[:order].dig('order','0','dir').to_s
      # order_hash = params.slice(:order).permit!.to_h
      # puts order_hash.dig('order','0','column').to_i
      # puts order_hash.dig('order','0','dir').to_s
      # https://github.com/ankane/notable_web/commit/e310ff831a70d266f5bb3d4f19f5a2d2d4959a34

    end
  end
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
    end
end

