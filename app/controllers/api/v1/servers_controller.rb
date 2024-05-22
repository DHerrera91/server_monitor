class Api::V1::ServersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_server, only: %i[ show update destroy ]
    
    # GET /servers
    def index
        @servers = Server.all
        
        render json: @servers
    end
    
    # GET /servers/1
    def show
        if @server
            render json:{data: @server, status: :ok}
        else
            render json:{message: 'Server could not be found', status:'bad_request'}
        end
    end
    
    # POST /servers
    def create
        @server = Server.new(server_params)
        
        if @server.save
            render json: @server, status: :created, location: @server
        else
            render json: @server.errors, status: :unprocessable_entity
        end
    end
    
    # PATCH/PUT /servers/1
    def update
        if @server.update(server_params)
            render json: {data: @server, status: :ok}
        else
            render json: @server.errors, status: :unprocessable_entity
        end
    end
    
    # DELETE /servers/1
    def destroy
        @server.destroy!
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
        @server = Server.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def server_params
        params.fetch(:server, {}).permit(:operational_state)
    end
end
