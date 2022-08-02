class FoldersController < ApplicationController
  before_action :set_folder!, only: %i[edit update show destroy]

  def index
    @folders = Folder.order created_at: :desc
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new folder_params
    if @folder.save
      # redirect_to folders_path
    else
      render :new
    end
  end

  def show; end

  def destroy
    @folder.destroy

    redirect_to folders_path, status: :see_other
  end

  def edit; end

  def update
    if @folder.update folder_params
      respond_to do |format|
        format.turbo_stream
      end
    else
      render :edit
    end
  end

  private

  def folder_params
    params.require(:folder).permit(:title, :description)
  end

  def set_folder!
    @folder = Folder.find(params[:id])
  end
end
