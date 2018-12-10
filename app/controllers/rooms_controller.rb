

class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    room = Room.find(params[:id])
    if room.is_authorized?(current_user.id) then
      @messages = Message.where(room_id: params[:id]).order(created_at: :asc)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
    
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    owner_id = params[:owner_id]
    participant_id = params[:participant_id]
    
    @room = Room.new(owner_id: owner_id, participant_id: participant_id)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created. Here you can Chat!' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_message
    room_id = params[:id]
    user_id = current_user.id
    message_content = params[:content]

    @message = Message.new(room_id: room_id, user_id: user_id, content: message_content)

    if @message.save then
      flash[:notice] = "Successfully, posted new message!"
    else
      flash[:error_message] = "Error, You cannot post empty or too long message"
    end
    
    redirect_back(fallback_location: root_path)
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:owner_id, :participant_id)
    end
end
