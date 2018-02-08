module Api
  module V1
    class PostsController < ApplicationController
      def index
        if params[:created_at].present?
          posts = Post.where(created_at: Time.zone.parse(params[:created_at]).at_beginning_of_day..Time.zone.parse(params[:created_at]).end_of_day)
        elsif params[:start].present?
          posts = Post.where(created_at: Time.zone.parse(params[:created_at]))
        else
          posts = Post.order('created_at DESC')
        end
        render json: { status: 'SUCCESS', data: posts }, status: :ok
      end

      def show
        post = Post.find(params[:id])
        render json: { status: 'SUCCESS', data: post }, status: :ok
      end
    end
  end
end
