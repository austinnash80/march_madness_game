class PicksController < ApplicationController
  before_action :set_pick, only: %i[ show edit update destroy ]

  # GET /picks or /picks.json
  def index
    @picks = Pick.all


    if params['draft'] == 'auto'
      # AUTO PICK LOGIC
        auto_draft
      Group.where(id: params['group_id']).update_all auto_draft_complete: true
      redirect_to group_path(id: params['group_id'])
      return
      elsif params['draft'] == 'live'
        live_draft
        # Group.where(id: params['group_id']).update_all auto_draft_complete: true
        redirect_to pages_live_draft_path(draft: 'live', group_id: params['group_id'])
      return
    end

  end

  # GET /picks/1 or /picks/1.json
  def show
  end

  # GET /picks/new
  def new
    @pick = Pick.new
  end

  # GET /picks/1/edit
  def edit
  end

  # POST /picks or /picks.json
  def create
    @pick = Pick.new(pick_params)

    respond_to do |format|
      if @pick.save
        format.html { redirect_to pick_url(@pick), notice: "Pick was successfully created." }
        format.json { render :show, status: :created, location: @pick }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /picks/1 or /picks/1.json
  def update
    respond_to do |format|
      if @pick.update(pick_params)
        format.html { redirect_to pick_url(@pick), notice: "Pick was successfully updated." }
        format.json { render :show, status: :ok, location: @pick }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picks/1 or /picks/1.json
  def destroy
    @pick.destroy

    respond_to do |format|
      format.html { redirect_to picks_url, notice: "Pick was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def auto_draft
    group_id = params['group_id']
    group_members = GroupMember.where(group_id: group_id).pluck(:user_id)
    all_seeds = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    
    all_seeds.each do |seeds|
      seed = School.where(seed: seeds).pluck(:id)
      seed_taken = []
      group_members.each do |i|
        school_id = (seed - seed_taken).sample
        Pick.create(
          group_id: group_id,
          user_id: i,
          school_id: school_id
          ).save
        seed_taken.push(school_id)
      end
    end
  end

  def live_draft
    params['group_id']
    all_seeds = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

    Pick.create(
      group_id: params['group_id'],
      school_id: params['school_id'],
      user_id: params['user_id']
      ).save

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pick
      @pick = Pick.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pick_params
      params.require(:pick).permit(:group_id, :user_id, :school_id)
    end
end
