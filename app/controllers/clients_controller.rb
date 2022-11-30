class ClientsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index
        render json: Client.all
    end

    def show
        client = find
        render json: client, serializer: SpecificClientMembershipSerializer
    end

    def update
        client = find
        client.update(client_params)
        render json: client, status: :accepted
    end

    private

    def find
        Client.find(params[:id])
    end

    def client_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end

end
