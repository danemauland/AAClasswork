class CatsController < ApplicationController
    
    def index
        @cats = Cat.all
        render :index
    end

    def show               
        @kitten = Cat.find_by(id: params[:id])
        render :show
    end

    def new
        @kitten = Cat.new
        render :new
    end
    
    def edit
        @kitten = Cat.find_by(id: params[:id])
        render :edit
    end

    def create
        @kitten = Cat.new(cat_params)

        if @kitten.save
            redirect_to cat_url(@kitten)
        else
            # @kitten.errors.full_messages status: 422
            render :new
        end
    end

    def update
        @kitten = Cat.find_by(id: params[:id])
        @kitten.update(cat_params)
        if @kitten.save
            redirect_to cat_url(@kitten)
        else
            # @kitten.errors.full_messages status: 422
            render :edit
        end
    end




    private

    def cat_params
        params.require(:cat).permit(:age, :birth_date, :color, :description, :sex, :name)
    end
end