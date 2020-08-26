$(document).ready(function() {
  /**
   * 定数・変数
   */
  dateFormat = 'yy-mm-dd';

  /**
   * 関数
   */
  function initializeNippoForm () {
    if($('#container_nippo_flg').prop("checked")){
      $('#container_daily').prop("disabled", false);
    } else {
      $('#container_daily').prop("disabled", true);
    }
  }

  function initializeGeppoForm () {
    if($('#container_geppo_flg').prop("checked")){
      $('#container_monthly').prop("disabled", false);
    } else {
      $('#container_monthly').prop("disabled", true);
    }
  }

  /**
   * イベント
   */
  $('#container_nippo_flg').click(function() {
    initializeNippoForm();
  })

  $('#container_geppo_flg').click(function() {
    initializeGeppoForm();
  })

  $('.clear-form').bind("click", function(){
    $(this.form).find("textarea, :text, select").val("").end().find(":checked").prop("checked", false);
    initializeNippoForm();
    initializeGeppoForm();
  });

  /**
   * 初期化
   */
  initializeNippoForm();
  initializeGeppoForm();
  $('.nippo-label, .entering-label, .leaving-label').datepicker({
    dateFormat: dateFormat
  });
  $('.sort-table').tablesorter();
});
