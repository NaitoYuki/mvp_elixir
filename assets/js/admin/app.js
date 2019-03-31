import './phoenix_html'
import $ from 'jquery'
import 'bootstrap'
import 'bootstrap4-tagsinput-douglasanpa/tagsinput'
import '@coreui/coreui'
import 'selectize/dist/js/standalone/selectize'

$(function () {
  // フラッシュメッセージ表示
  $('.flash-notice, .flash-alert').each(function () {
    if (this.innerHTML) {
      $(this).show();
    }
  });

  // tagsinput
  $(document).on('beforeItemAdd', '[data-role="tagsinput"]', (event) => {
    if (event.item.match(/.+@.+\..+/) == null) {
      alert('Email is invalid.');
      event.cancel = true;
    }
  });

  // 動的ネストフォーム
  $(document).on('click', '[role="add-nested-form"]', function () {
    let $template = $($(this).data('template'));
    $template.find('[name]').each(function () {
      $(this).attr('name', $(this).attr('name').replace('[]', `[${Date.now()}]`));
    });
    $(this).before($template);
    $template.trigger('nested-form:added');
    return false;
  });
  $(document).on('click', '[role="remove-nested-form"]', function () {
    let $target = $(this).parents('.nested-form');
    let match = $target.find('[name]').first().attr('name').match(/\[[0-9]+\]/);
    if (match) {
      let namePrefix = match.input.slice(0, match.index + match[0].length);
      let $id = $(`[name="${namePrefix}[id]"]`).first();
      if ($id.length) {
        $id.after($('<input>').attr({
          type: 'hidden',
          name: `${namePrefix}[delete]`,
          value: 1,
        }));
      }
    }
    $target.remove();
    return false;
  });

  // ツールチップ初期化
  $('[data-toggle="tooltip"]').tooltip({
    html: true,
    placement: 'right',
    title() {
      return this.dataset['content'].replace(/\r?\n/g, '<br />');
    }
  });
});
