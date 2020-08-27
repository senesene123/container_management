require 'active_model'

class SearchForm
  include ActiveModel::Model

  attr_accessor :nippo_flg, :geppo_flg
  validate :flg_check

  def flg_check
    return true unless nippo_flg == '0' && geppo_flg == '0'

    errors.add(:nippo_flg, '日報または月報にチェックを入れてください。')
  end
end
