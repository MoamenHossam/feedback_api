module Api
  module V1
    class FeedbacksController < ApplicationController

     #  POST    http://localhost:3000/api/v1/feedbacks
     # {"feedback":{"company_token":"448765578","priority":2},
     # "state":{"os":"android","device":"samsung","storage":6021,"memory":3050}}
      def create
       feedback = Feedback.new(feedback_params)
       state = State.new(state_params)
       a = Rails.cache.fetch([self , "feedback_count"]) { Feedback.where('company_token =?', feedback.company_token).last }
       render json: {status: 'SUCCESS',message:'heres your feedback number',data:a.number+1},status: :ok
       company_token=feedback.company_token
       priority=feedback.priority
       os=state.os
       device=state.device
       memory=state.memory
       storage=state.storage
       HardWorker.perform_async(company_token,priority,os,device,memory,storage)
      end


      #GET      http://localhost:3000/api/v1/feedbacks?token=45555
      def index
        puts "hello#{params[:token]}"
        com = params[:token]
        feedbacks=Feedback.search(com)
        if feedbacks
          render json: {status: 'SUCCESS',message:"here is the feedbacks for company token #{com}",data:feedbacks}, status: :ok
        else
          render json: {status: 'FAILED',message:'there is no feedbacks for company token ',data:feedbacks.errors},status: :not_found
        end
      end

      #GET      http://localhost:3000/api/v1/feedbacks/count/[token_number]
      #GET      http://localhost:3000/api/v1/feedbacks/count/448765578
      def count
       feedback = Rails.cache.fetch([self , "feedback_count"]) { Feedback.where('company_token =?', params[:id]).last }
       if feedback
         puts "#{feedback.number}"
         f_n=feedback.number
         render json: {status: 'SUCCESS',message:'feedback saved',data:f_n}, status: :ok
       else
         render json: {status: 'FAILED',message:'there is no feedbacks for company token '},status: :not_found
       end
      end

      #GET      http://localhost:3000/api/v1/feedbacks/[feed_number]?token=[token_number]
      #GET      http://localhost:3000/api/v1/feedbacks/6?token=448765578
      def show
       feed = Feedback.where('company_token =?', params[:token]).find_by number: params[:number]
       render json: {status: 'SUCCESS',message:'heres your feedback',data:feed},status: :ok
      end


      private
      def feedback_params
        params.require(:feedback).permit(:company_token, :priority)
      end

      def state_params
        params.require(:state).permit(:os, :device, :memory, :storage)
      end
    end
  end
end
