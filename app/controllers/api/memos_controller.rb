class Api::MemosController < ApplicationController
  before_action :set_api_memo, only: [:update, :destroy]

  # GET /api/memos.json
  def index
    @api_memos = Memo.all
  end

  # POST /api/memos.json
  def create
    @api_memo = Memo.new(api_memo_params)

    respond_to do |format|
      if @api_memo.save
        format.html { redirect_to @api_memo, notice: 'Memo was successfully created.' }
        format.json { render :show, status: :created, location: @api_memo }
      else
        format.html { render :new }
        format.json { render json: @api_memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/memos/1.json
  def update
    respond_to do |format|
      if @api_memo.update(api_memo_params)
        format.html { redirect_to @api_memo, notice: 'Memo was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_memo }
      else
        format.html { render :edit }
        format.json { render json: @api_memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/memos/1.json
  def destroy
    @api_memo.destroy
    respond_to do |format|
      format.html { redirect_to api_memos_url, notice: 'Memo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_memo
      @api_memo = Memo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_memo_params
      params.fetch(:api_memo, {})
    end
end
