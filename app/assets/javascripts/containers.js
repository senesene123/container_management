$(document).ready(function() {
  /**
   * 定数・変数
   */
  dateFormat = 'yy-mm-dd';

  /**
   * イベント
   */
  $('#nippo_flg').click(function() {
    if($('#daily').prop("disabled")){
      $('#daily').prop("disabled", false);
    } else {
      $('#daily').prop("disabled", true);
    }
  })

  $('#geppo_flg').click(function() {
    if($('#monthly').prop("disabled")){
      $('#monthly').prop("disabled", false);
    } else {
      $('#monthly').prop("disabled", true);
    }
  })

  /**
   * 初期化
   */
  $('#daily').prop("disabled", true);
  $('#monthly').prop("disabled", true);
  $('.nippo_label').datepicker({
    dateFormat: dateFormat
  });
});
