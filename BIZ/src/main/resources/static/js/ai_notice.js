var nowPages = 1;
var totalPages = 1;
var visiblePages = 5;

var pageSize = 3;
var page_st = 1;
var page_end = 5;

// 글쓰기
function fn_write() {

	var form = document.getElementById("noticeForm");

	form.action = "<c:url value='/notice/writeForm.do'/>";
	form.submit();

}

// 글조회
function fn_view(code) {

	var form = document.getElementById("noticeForm");
	var url = "<c:url value='/notice/list'/>";
	url = url + "?code=" + code;

	form.action = url;
	form.submit();
}

// 게시글 조회
function view_notice(code) {
	// console.log('-- view_board -- ', code);

	$.ajax({
		type : "GET",
		url : "/notice/detail?code=" + code,
		contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만
		// 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
		cache : false,
		timeout : 600000,
		success : function(data) {
			console.log("SUCCESS : ", data);

			showModal('READ', data);
		},
		error : function(e) {
			alert("error :: " + e.responseText);
			console.log("ERROR : ", e);
		}
	});
}

function showModal(type, data) {
	// console.log('-- showModal -- ', type);
	if (type === 'EDIT') {
		$('#newModalLabel').text('게시글 신규 등록');

		$("#inputNoticeName").attr("readonly", false);

		$("#inputNoticeDesc").attr("readonly", false);

		$('.readNotice').hide();
		$('.editNotice').show();
	} else { // type === 'READ'
		var d = data[0];
		$('#newModalLabel').text('게시글 상세 조회');

		$("#inputNoticeName").attr("readonly", true);
		$("#inputNoticeName").val(d.title);

		$("#inputNoticeDesc").attr("readonly", true);
		$("#inputNoticeDesc").val(d.contents);

		$("#noticeCode").val(d.code);
		$("#noticeWriter").val(d.writer);
		$("#noticeDate").val(d.reg_datetime.substr(0, 19));

		$('.readNotice').show();
		$('.editNotice').hide();
	}

	$('#noticeNewModal').modal('show');
}

// 페이징처리
function getPagination() {
	$.ajax({
		type : 'GET',
		url : '/notice/totalPage',
		async : 'true',
		processData : true,
		cache : false,
		success : function(data) {
			if (data[0] != "0") {
				totalPages = Math.ceil(data[0] / visiblePages);
				grid_pagination(totalPages, visiblePages);
			}
		},
		error : function(request, status, error) {
		}
	});
}

function grid_pagination(totalPages, visiblePages) {
	// alert("grid_pagination :: " + totalPages + " :: " + visiblePages);

	$('#pagination').twbsPagination('destroy');
	window.pagObj = $('#pagination').twbsPagination({
		totalPages : totalPages,
		visiblePages : visiblePages,
		onPageClick : function(event, page) {
			// alert("on1 " + page + ' (from event listening)');

			page_st = ((1 * pageSize) * page) - (pageSize - 1);
			page_end = (page_st + pageSize) - 1;

			search_notice(page, page_st, page_end);
		}
	}).on('page', function(event, page) {
		// alert("on2 " + page + ' (from event listening)');
	});
}

function search_notice(now_page, page_st, page_end) {

	// alert("search_campaign call :: now[" + now_page + "] :: interval["
	// +visiblePages +"] :: st[" + page_st + "] :: end[" + page_end + "]" );

	var notice = new Object();
	notice.page_st = page_st;
	notice.page_end = page_end;

	$.ajax({
		type : 'GET', // method
		url : '/notice/listPage',
		async : 'true', // true
		cache : false,
		data : notice,
		processData : true,
		success : function(data) {

			grid_table_notice(data);

		},
		error : function(request, status, error) {
			// alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function grid_table_notice(obj) {
	var div = document.querySelector('#ai_notice');

	var html = '';
	$.each(obj, function(i, val) {
		html += '<tr onClick="view_notice(' + val.code + ')">';
		$.each(val, function(k, v) {
			if (k == 'contents') {
				return;
			}

			if (k == 'reg_datetime') {
				v = v.substr(0, 10);
			}

			if (v == 'null' || v == '') {

			} else if (k == 'title') {
				html += '<td style="text-align: left; padding-left: 10px;">'
						+ v + '</td>';
			} else {
				html += '<td>' + v + '</td>';
			}
		});
		html += '</tr>';
	});
	html += '</tbody>';

	// console.log("Tbody == " + html);
	div.innerHTML = html;
}
