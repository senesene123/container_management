require 'active_model'

class SearchForm
  include ActiveModel::Model

  attr_accessor :nippo_flg, :geppo_flg

  def flg_check
    errors.add(:base, '日報または月報にチェックを入れてください。') if nippo_flg == '0' && geppo_flg == '0'
  end
end
