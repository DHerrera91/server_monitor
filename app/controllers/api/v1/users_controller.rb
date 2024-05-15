class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: %i[ show update destroy ]
    
    # GET /users
    def index
        @users = User.all
        
        if @users
            render json: {status: "SUCCESS", message: "Fetched all the users successfully", data: @users, status: :ok}
        else
            render json: @user.errors, status: :bad_request
        end
    end
    
    # GET /users/1
    def show
        
        
        if @user
            render json: {data: @user, status: :ok}
        else 
            render json: {message: "User could not be found", status: "bad_request"}  
        end
    end
    
    # POST /users
    def create
        @user = User.new(user_params)
        
        if @user.save
            render json: {status: "SUCCESS", message: "User was created successfully!", data: @user, status: :created}
        else
            render json: {message: "User could not be created", status: :unprocessable_entity}
        end
    end
    
    # PATCH/PUT /users/1
    def update
        
        
        if @user.update(user_params)
            render json: {message:"User succesfully updated", data: @user, status: :ok}
        else
            render json: {message: "User could not be updated", status: :unprocessable_entity}
        end
    end
    
    # DELETE /users/1
    def destroy
        
        
        if @user.destroy!
            render json: {message: "User deleted succesfully", data: @user, status: :ok}
        else
            raise ActiveRecord::RecordNotFound
        end
    rescue ActiveRecord::RecordNotFound
        render json: {message: "User does not exist", status: :not_found}
    end
    
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def user_params
        params.fetch(:user, {}).permit(:id, :first_name, :last_name, :password, :role, :email)
    end
end
