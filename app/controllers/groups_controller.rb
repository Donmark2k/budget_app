class GroupsController < ApplicationController
    before_action :set_group, only: %i[show edit update destroy]
    load_and_authorize_resource

  
    # GET /groups or /groups.json
    def index
        # @groups = Group.all
        # @user = current_user
      @groups = current_user.groups.all
      @total_expenses = current_user.groups.joins(:expenses).sum('expenses.amount')
    # @total_expenses = current_user.expenses.sum(:amount)

    end

    def splash
    
    end
  
    # GET /groups/1 or /groups/1.json
    def show
      @group = Group.find(params[:id])
      render 'show', locals: { group: @group }

    end
  
    # GET /groups/new
    def new
      @group = Group.new
    end
  
    # GET /groups/1/edit
    def edit; end
  
    # POST /groups or /groups.json
    # def create
    #   @group = current_user.groups.new(group_params)
  
    #   respond_to do |format|
    #     if @group.save
    #       format.html { redirect_to user_groups_path(current_user), notice: 'Category was successfully created.' }
    #       format.json { render :show, status: :created, location: @group }
    #     else
    #       format.html { render :new, status: :unprocessable_entity }
    #       format.json { render json: @group.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end
    def create
      @group = current_user.groups.new(group_params)
        
        if @group.save
          icon_file = params[:group][:icon]
          if icon_file
            icon_filename = icon_file.original_filename
            icon_filepath = Rails.root.join('app', 'assets', 'images', 'icons', icon_filename)
            File.open(icon_filepath, 'wb') do |file|
              file.write(icon_file.read)
            end
            @group.update(icon: "icons/#{icon_filename}")
          end
          redirect_to user_groups_path(current_user), notice: 'Category was successfully created.'
        else
          render :new, status: :unprocessable_entity
        end
      end
  
    # PATCH/PUT /groups/1 or /groups/1.json
    def update
      respond_to do |format|
        if @group.update(group_params)
          format.html { redirect_to group_url(@group), notice: 'Category was successfully updated.' }
          format.json { render :show, status: :ok, location: @group }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /groups/1 or /groups/1.json
    def destroy
      @group.destroy
  
      respond_to do |format|
        format.html { redirect_to groups_path, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:user_id, :name, :icon)
    end
  end