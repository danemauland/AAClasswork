class SubsController < ApplicationController

    before_action :ensure_logged_in, only: [:new, :create, :destroy, :edit, :update]
    before_action :ensure_moderator, only: [:edit, :update, :destroy]

    def ensure_moderator
        @sub = Sub.find(params[:id])
        if @sub.moderator_id != current_user.id
            flash[:errors] = ["You are not the moderator"]
            redirect_to subs_url
        end
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = current_user.subs.new(sub_params)
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.includes(:posts).find(params[:id])
        render :show
    end

    def destroy
        @sub.destroy
        redirect_to subs_url
    end

    def edit #returns html
        render :edit
    end

    def update #saves it to the db
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
