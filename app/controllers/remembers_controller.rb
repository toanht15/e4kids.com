class RemembersController < ApplicationController
  #before_action :set_remember, only: [:show, :edit, :update, :destroy]






  def create
  	@vocabulary = Vocabulary.find(params[:vocabulary_id])
  	@remember = current_user.remembers.create(vocabulary: @vocabulary)
  	#if @remember.save
  		redirect_to :back
  	#end
  	
  	# redirect_to root_path
  	# if @remembers.save
  	# 	redirect_to root_path
  	# end

    # @remember = Remember.new(remember_params)

    # respond_to do |format|
    #   if @remember.save
    #     format.html { redirect_to @remember, notice: 'Remember was successfully created.' }
    #     format.json { render :show, status: :created, location: @remember }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @remember.errors, status: :unprocessable_entity }
    #   end
    # end
  end



  def destroy
   @vocabulary = Vocabulary.find(params[:vocabulary_id])
  	@remember = current_user.remembers.where(:vocabulary_id => @vocabulary.id)
  	@remember.destroy
  	#if @remember.save
  		redirect_to root_path
  	#end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remember
      @remember = Remember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remember_params
      params.require(:remember).permit(:user_id, :vocabulary_id)
    end
end
