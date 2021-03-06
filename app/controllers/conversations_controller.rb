class ConversationsController < ApplicationController
  skip_after_action :verify_authorized
  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
    @conversation = Conversation.new
    authorize @conversation
  end

before_action :set_conversation, except: [:index]
before_action :check_participating!, except: [:index]

  def show
    @personal_message = PersonalMessage.new
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
    authorize @conversation
  end

  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end


end
