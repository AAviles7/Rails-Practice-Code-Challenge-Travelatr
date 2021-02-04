class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def new
        @blogger = Blogger.new
    end

    def create
        # @error_msg = ""
        if Blogger.find_by(name: params[:name])
            # @error_msg = "User name #{params[:name]} already taken. Enter different name. Please."
            redirect_to new_blogger_path
        elsif params[:age].to_i <= 0
            redirect_to new_blogger_path
        elsif params[:bio].length <= 30
            redirect_to new_blogger_path
        else
            @blogger = Blogger.create(name: params[:name], bio: params[:bio], age: params[:age])
            redirect_to blogger_path(@blogger)
        end
    end

end