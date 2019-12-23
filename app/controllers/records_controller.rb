# class RecordsController < ApplicationController
#   before_action :record_params, only: :create

#   def create
#     record = Record.create(record_params)
#   end

#   private 

#   def record_params 
#     params.require(:records).permit(:name, files: [])
#   end
# end
