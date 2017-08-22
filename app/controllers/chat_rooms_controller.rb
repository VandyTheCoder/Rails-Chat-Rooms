class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def edit
    @chat_room = ChatRoom.find(params[:id])
  end

  def update
    @chat_room = ChatRoom.find(params[:id])
    if @chat_room.update(chat_room_params)
      redirect_to @chat_room, notice: 'Chat Room was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @chat_room = ChatRoom.find(params[:id])
    if @chat_room.destroy
      redirect_to chat_rooms_path, notice: 'Chart Room was deleted successfully.'
    else
      redirect_to chat_rooms_path, notice: 'Chart Room was deleted unsuccessfully.'
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :description)
  end
end