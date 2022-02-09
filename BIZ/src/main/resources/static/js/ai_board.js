var nowPages = 1;
var totalPages = 1;
var visiblePages = 5;

var page_st = 1;
var page_end = 5;
var pageSize = 10;

// 페이징처리
function getPagination() {
	$.ajax({
		type : 'GET',
		url : '/board/totalPage',
		async : 'true',
		processData : true,
		cache : false,
		success : function(data) {
			if (data[0] != "0") {
				totalPages = Math.ceil(data[0] / pageSize);

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

			search_board(page, page_st, page_end);
		}
	}).on('page', function(event, page) {
		// alert("on2 " + page + ' (from event listening)');
	});
}

function search_board(now_page, page_st, page_end) {

	// alert("search_campaign call :: now[" + now_page + "] :: interval["
	// +visiblePages +"] :: st[" + page_st + "] :: end[" + page_end + "]" );

	var board = new Object();
	board.page_st = page_st;
	board.page_end = page_end;

	$.ajax({
		type : 'GET', // method
		url : '/board/listPage',
		async : 'true', // true
		cache : false,
		data : board,
		processData : true,
		success : function(data) {

			grid_table_board(data);

		},
		error : function(request, status, error) {
			// alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function grid_table_board(obj) {
	var div = document.querySelector('#ai_board');

	var html = '';
	$.each(obj, function(i, val) {
		html += '<tr onClick="view_board(' + val.code + ')">';
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
