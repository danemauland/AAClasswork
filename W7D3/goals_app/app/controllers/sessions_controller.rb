class SessionsController < ApplicationController

    def show
        render json: {hello: :world}
    end
end