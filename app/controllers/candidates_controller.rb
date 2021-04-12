class CandidatesController < ApplicationController
  def index
    # @candidates = Candidate.all
    # @candidates = candidate.where(deleted_at:nil)
    @candidates = Candidate.available
  end

  # def index_deleted
  #   @candidate = Candidate.deleted
  # end


  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidates_params)
    if @candidate.save
      #成功
      # flash[:notice] = "ha"
      redirect_to candidates_path, notice: "新增成功"
    else
      #失敗
      render :new
    end
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])
    # byebug
    if @candidate.update(candidates_params)
      redirect_to candidates_path, notice: "更新成功"
    else
      render :edit
    end
  end

  # def self.all
  #   # where(deleted_at: nil)
  #   #會造成無窮迴圈
  # end
  
  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    # @candidate.destroy if @candidate  #真刪除
    # @candidate.update(deleted_at: Time.now) #假刪除
    @candidate.destroy if @candidate
    #在上層定義一個destroy假刪除
    redirect_to candidates_path, notice: "已刪除"
  end
  
  private
  def candidates_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end

  

end
