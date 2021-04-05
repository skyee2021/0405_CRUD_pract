class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidates_params)

    if @candidate.save
      #成功
      redirect_to candidates_path, notice: "新增成功"
    else
      #失敗
      redner :new
    end
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])
    
    if @candidate.update(candidates_params)
      redirect_to candidates_path, notice: "更新成功"
    else
      redner :edit
    end
  end
  
  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy if @candidate
    redirect_to candidates_path, notice: "已刪除"
  end
  
  private
  def candidates_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end

  

end
