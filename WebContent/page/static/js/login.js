//------------- login.js -------------//
$(document).ready(function () {

    //for custom checkboxes
    $('input').not('.noStyle').iCheck({
        checkboxClass: 'icheckbox_flat-green'
    });

    //validate login form
    $("#login-form").validate({
        ignore: null,
        ignore: 'input[type="hidden"]',
        errorPlacement: function (error, element) {
            wrap = element.parent();
            wrap1 = wrap.parent();
            if (wrap1.hasClass('checkbox')) {
                error.insertAfter(wrap1);
            } else {
                if (element.attr('type') == 'file') {
                    error.insertAfter(element.next());
                } else {
                    error.insertAfter(element);
                }
            }
        },
        errorClass: 'help-block',
        rules: {
            username: {
                required: true,
//				minlength: 0
            },
            password: {
                required: true,
//				minlength: 0
            }
        },
        messages: {
            password: {
                required: "密码不能为空",
//				minlength: "密码长度必须大于0"
            },
            username: "用户名不能为空",
        },
        highlight: function (element) {
            if ($(element).offsetParent().parent().hasClass('form-group')) {
                $(element).offsetParent().parent().removeClass('has-success').addClass('has-error');
            } else {
                if ($(element).attr('type') == 'file') {
                    $(element).parent().parent().removeClass('has-success').addClass('has-error');
                }
                $(element).offsetParent().parent().parent().parent().removeClass('has-success').addClass('has-error');

            }
        },
        unhighlight: function (element, errorClass) {
            if ($(element).offsetParent().parent().hasClass('form-group')) {
                $(element).offsetParent().parent().removeClass('has-error').addClass('has-success');
                $(element.form).find("label[for=" + element.id + "]").removeClass(errorClass);
            } else if ($(element).offsetParent().parent().hasClass('checkbox')) {
                $(element).offsetParent().parent().parent().parent().removeClass('has-error').addClass('has-success');
                $(element.form).find("label[for=" + element.id + "]").removeClass(errorClass);
            } else if ($(element).next().hasClass('bootstrap-filestyle')) {
                $(element).parent().parent().removeClass('has-error').addClass('has-success');
            }
            else {
                $(element).offsetParent().parent().parent().removeClass('has-error').addClass('has-success');
            }
        }
    });

    $("#register-form").validate({
        ignore: null,
        ignore: 'input[type="hidden"]',
        errorPlacement: function (error, element) {
            wrap = element.parent();
            wrap1 = wrap.parent();
            if (wrap1.hasClass('checkbox')) {
                error.insertAfter(wrap1);
            } else {
                if (element.attr('type') == 'file') {
                    error.insertAfter(element.next());
                } else {
                    error.insertAfter(element);
                }
            }
        },
        errorClass: 'help-block',
        rules: {
            username: {
                required: true,
//				minlength: 0
            },
            password: {
                required: true,
//				minlength: 0
            }
        },
        messages: {
            username: "用户名不能为空",
            password: {
                required: "密码不能为空",
//				minlength: "密码长度必须大于0"
            },
            password2: {
                required: "密码不能为空",
//				minlength: "密码长度必须大于0"
            },

        },
        highlight: function (element) {
            if ($(element).offsetParent().parent().hasClass('form-group')) {
                $(element).offsetParent().parent().removeClass('has-success').addClass('has-error');
            } else {
                if ($(element).attr('type') == 'file') {
                    $(element).parent().parent().removeClass('has-success').addClass('has-error');
                }
                $(element).offsetParent().parent().parent().parent().removeClass('has-success').addClass('has-error');

            }
        },
        unhighlight: function (element, errorClass) {
            if ($(element).offsetParent().parent().hasClass('form-group')) {
                $(element).offsetParent().parent().removeClass('has-error').addClass('has-success');
                $(element.form).find("label[for=" + element.id + "]").removeClass(errorClass);
            } else if ($(element).offsetParent().parent().hasClass('checkbox')) {
                $(element).offsetParent().parent().parent().parent().removeClass('has-error').addClass('has-success');
                $(element.form).find("label[for=" + element.id + "]").removeClass(errorClass);
            } else if ($(element).next().hasClass('bootstrap-filestyle')) {
                $(element).parent().parent().removeClass('has-error').addClass('has-success');
            }
            else {
                $(element).offsetParent().parent().parent().removeClass('has-error').addClass('has-success');
            }
        }
    });

});