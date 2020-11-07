class AtodosController < ApplicationController

    def show
        render json: Atodo.find(params[:id])        
    end

    def create
        @atodo = Atodo.new(atodos_params)
        if @atodo.save
            render json: @atodo
        else
            render json: @atodo.errors.full_messages, status: 422
        end
    end

    def index
        render json: Atodo.all
    end
    
    def update
        @atodo = Atodo.find(params[:id])
        if @atodo.update(atodos_params)
            render json: @atodo
        else
            render json: @atodo.errors.full_messages, status: 422
        end
    end

    def destroy
        @atodo = Atodo.find(params[:id])
        @atodos = Atodo.all
        render json: @atodos if @atodo && @atodo.destroy      
    end

    private
    def atodos_params
        params.require(:atodo).permit(:body, :title, :done)
    end
end
