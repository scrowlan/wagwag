class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @pet = Pet.find(params[:id])
  end

  # GET /pets/new
  def new
    @pet = Pet.new
    @users = []

    if should_show_user_picker
      #get all users to show in admin picker
      @users = User.all.order(:email)
    end

  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)

    if current_user.is_customer
      #if the current user is a customer, assign the pet to them
      @pet.user_id = current_user.id
    elsif params[:user_id] != nil
      #if the user_id param is populated
      @pet.user = User.find(params[:pet][:user_id])
    end

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :user_id)
    end

  def should_show_user_picker
    !current_user.is_customer
  end

end
