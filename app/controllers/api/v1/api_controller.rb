module Api
  module V1
    class ApiController < ApplicationController
      def index
        posts = Post.order('created_at DESC')
        
      end
    end
  end
end