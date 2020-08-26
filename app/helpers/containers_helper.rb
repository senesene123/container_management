module ContainersHelper
  def nippo_flg_check
    @search_params[:nippo_flg] == '1'
  end

  def geppo_flg_check
    @search_params[:geppo_flg] == '1'
  end
end
