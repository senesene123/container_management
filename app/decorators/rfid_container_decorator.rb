class RfidContainerDecorator < Draper::Decorator
  delegate_all

  def entering_condition
    if entering_flg
      h.tag.span class: 'label label-success' do
        '入庫中'
      end
    else
      h.tag.span class: 'label label-default' do
        '出庫済'
      end
    end
  end

  def contents_size_for_display
    case contents_size
    when '00000001'
      'S'
    when '00000002'
      'M'
    when '00000003'
      'L'
    end
  end
end
