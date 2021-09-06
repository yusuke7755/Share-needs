$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(department){
    var html = `<option value="${department.name}" data-department="${department.id}">${department.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                        <div class='listing-select-wrapper__box'>
                          <select class="listing-select-wrapper__box--select" id="child_department" name="department_id">
                            <option value="---" data-department="---">---</option>
                            ${insertHTML}
                          <select>
                          <i class='fas fa-chevron-down listing-select-wrapper__box--arrow-down'></i>
                        </div>
                      </div>`;
    $('.listing-product-detail__department').append(childSelectHtml);
  }