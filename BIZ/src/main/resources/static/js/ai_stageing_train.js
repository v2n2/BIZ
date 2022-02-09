var s1_totalpage = 10;
var s1_visiblePages = 10;

var s1_page_st = 1;
var s1_page_end = 10;


function grid_pagingSt1(div){
	//alert("call grid_pagingSt ");
	
	div.twbsPagination('destroy');
	window.pagObj = div.twbsPagination({
          totalPages: s1_totalpage,
          visiblePages: s1_visiblePages,
          onPageClick: function (event, page) {
        	  //alert("on1 " + page + ' (from event listening)');
        	  
        	  s1_page_st = ((1 * s1_visiblePages) * page) - (s1_visiblePages - 1);
        	  s1_page_end = (s1_page_st + s1_visiblePages) - 1;
        	  
        	  //alert("grid_pagingSt s1_page_st [" + s1_page_st + "] , s1_page_end[" + s1_page_end + "],  page[" +page +"]" );
        	  
        	  search_st1();
          }
    }).on('page', function (event, page) {
        //alert("on2 " + page + ' (from event listening)');
    });
}


function search_st1(){
	//alert("search_st :: cam_id[" + currentValue + "],s1_totalpage[" + s1_totalpage + "], s1_page_st[" + s1_page_st + "], s1_page_end[" + s1_page_end + "]");
	
	var cam_id = currentValue;
	
	var page = new Object();
	page.cam_id = cam_id;
	page.page_st = s1_page_st;
	page.page_end = s1_page_end;
	page.page = s1_totalpage;
	
	$.ajax({
        type    : 'GET', // method
        url     : '/staging/train',
        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
        async   : 'true', // true
        data    : page, // GET 요청은 지원되지 않습니다.
        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
        cache: false,
        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
        success : function(data){
        	var obj = JSON.stringify(data, true, 2);
        	//alert("search_st result :: " + obj);
        	
        	grid_tableStaging1(obj);
        	
        },
        error : function(request,status,error){
        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});

}

function grid_tableStaging1(obj){
	//alert("grid_table_campaign :: " + obj);
	var div = document.querySelector('#ai_staging_train');
    
    html = '<table width="100%" class="table table-bordered table-hover">';
    html += '<thead><tr>';
    html += 	'<th>SEQ</th>';
    html += 	'<th>캠페인ID</th>';
    
    html += 	'<th>컬럼1</th>';
    html += 	'<th>컬럼2</th>';
    html += 	'<th>컬럼3</th>';
    html += 	'<th>컬럼4</th>';
    html += 	'<th>컴럼5</th>';
    html += 	'<th>컴럼6</th>';
    html += 	'<th>컴럼7</th>';
    html += 	'<th>컬럼8</th>';
    html += 	'<th>컬럼9</th>';
    html += 	'<th>컬럼10</th>';
    html += 	'<th>컬럼200</th>';
    html += 	'<tr></thead>';
    html += '<tbody>';
    
    var json = $.parseJSON(obj);
 	  $(json).each(function(i,val){
 		html += '<tr>';
 		//html += '<td><input type="checkbox" name="camCheck"/></td>';
 		$.each(val,function(k,v){
 			
 			if(k == 'st_seq' || k == 'cam_id') {
 				html += '<td>' + v + '</td>';
 			}
 			
 			if(k == 'st_c1' 
 			 || k == 'st_c2'
 			 || k == 'st_c3'
 	   		 || k == 'st_c4'
 	   		 || k == 'st_c5'
 	   		 || k == 'st_c6'
 	   		 || k == 'st_c7'
 	   		 || k == 'st_c8'
 	   		 || k == 'st_c9'
 	   		 || k == 'st_c10'
 	   		 || k == 'st_c200'
 			){
 				html += '<td>' + v + '</td>';
 			}
 		});
 		html += '</tr>';
	  });
 	  
 	  html += '</tbody>';
    html += '</table>';
    
    div.innerHTML = html;
}


