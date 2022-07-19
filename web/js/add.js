function myFunction() {
    let submitx = document.getElementById('submit').innerHTML;
    let subjec_id = document.getElementById('subject_id');
    let id = subjec_id.options[subjec_id.selectedIndex].value;
    let type1 = document.getElementById('type');
    let type = type1.options[type1.selectedIndex].value;
    let title = document.getElementById('title').value;
    let Value = document.getElementById('value').value;
    let Display = document.getElementById('order').value;
    let statusx = $('input[name="status"]:checked').val();
    if (title.trim() === '' || Display.trim() === '') {
        ToastMaker("Please fill out the information completely!", 3000, {
            styles: {fontSize: '20px', backgroundColor: 'red'},
            classList: ['custom-class', 'other-custom-class'],
            align: 'center',
            valign: 'top'
        });
    } else {
        $.ajax({
            url: "subjectsetting",
            type: 'POST',
            data: {
                action: "add",
                submit: submitx,
                sub_id: id,
                type: type,
                title: title,
                value: Value,
                Display: Display,
                status: statusx
            },
            success: function (data) {
                var tm = ToastMaker;
                if (data === "Successfully!") {
                    tm(data, 5000, {
                        styles: {fontSize: '20px', backgroundColor: 'green'},
                        classList: ['custom-class', 'other-custom-class'],
                        align: 'center',
                        valign: 'top'
                    });
                    document.getElementById('myForm').reset();
                } else {
                    tm(data, 5000, {
                        styles: {fontSize: '20px', backgroundColor: 'red'},
                        classList: ['custom-class', 'other-custom-class'],
                        align: 'center',
                        valign: 'top'
                    });
                }
            },
            error: function (jqXHR) {
            }
        });
    }
}

function clsAlphaNoOnly(e) {  // Accept only alpha numerics, no special characters 
    var regex = new RegExp("^[a-zA-Z0-9 ]+$");
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (regex.test(str)) {
        return true;
    }
    e.preventDefault();
    return false;
}

function update() {
    let submitx = document.getElementById('submit').innerHTML;
    let sub_idx = document.getElementById('set_id').innerHTML;
    let idx = document.getElementById('sub_name');
    let id_subject = idx.options[idx.selectedIndex].value;
    let type = document.getElementById('type');
    let id_type = type.options[type.selectedIndex].value;
    let title = document.getElementById('sub_title').value;
    let value = document.getElementById('sub_value').value;
    let order = document.getElementById('order').value;
    let statusx = $('input[name="status"]:checked').val();

    if (title.trim() === '' || order.trim() === '') {
        ToastMaker("Please fill out the information completely!", 3000, {
            styles: {fontSize: '20px', backgroundColor: 'red'},
            classList: ['custom-class', 'other-custom-class'],
            align: 'center',
            valign: 'top'
        });
    } else {
        $.ajax({
            url: "subjectsetting",
            type: 'POST',
            data: {
                action: "edit",
                submit: submitx,
                sub_idx: sub_idx,
                id_subject: id_subject,
                id_type: id_type,
                title: title,
                value: value,
                order: order,
                status: statusx
            },
            success: function (data) {
                var tm = ToastMaker;
                if (data === "Update Successfully!") {
                    tm(data, 5000, {
                        styles: {fontSize: '20px', backgroundColor: 'green'},
                        classList: ['custom-class', 'other-custom-class'],
                        align: 'center',
                        valign: 'top'
                    });
                    document.getElementById('myForm').reset();
                } else {
                    tm(data, 5000, {
                        styles: {fontSize: '20px', backgroundColor: 'red'},
                        classList: ['custom-class', 'other-custom-class'],
                        align: 'center',
                        valign: 'top'
                    });
                }
            },
            error: function (jqXHR) {

            }
        });
    }

    function urlSearch(key, val) {
        var url = new URL(window.location.href);
        url.searchParams.set(key, val);
        document.location.search = url.search;
    }

    function search() {
        var url = new URL(window.location.href);
        var valSearch = encodeURI($("#inputSearch").val());
        var isByName = $("#byNameCheckSearch")[0].checked;
        var isByEmail = $("#byEmailCheckSearch")[0].checked;
        if (isByName)
            url.searchParams.set("name", valSearch);
        if (isByEmail)
            url.searchParams.set("email", valSearch);
        if (!isByName)
            url.searchParams.set("name", "");
        if (!isByEmail)
            url.searchParams.set("email", "");
        if (!isByName && !isByEmail)
            url.searchParams.set("name", valSearch);
        document.location.search = url.search;
    }
}

