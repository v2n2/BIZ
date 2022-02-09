var s2_totalpage = 10;
var s2_visiblePages = 10;

var s2_page_st = 1;
var s2_page_end = 10;


function grid_pagingSt2(div){
	//alert("call grid_pagingSt2 ");
	
	div.twbsPagination('destroy');
	window.pagObj = div.twbsPagination({
          totalPages: s2_totalpage,
          visiblePages: s2_visiblePages,
          onPageClick: function (event, page) {
        	  //alert("on1 " + page + ' (from event listening)');
        	  
        	  s2_page_st = ((1 * s2_visiblePages) * page) - (s2_visiblePages - 1);
        	  s2_page_end = (s2_page_st + s2_visiblePages) - 1;
        	  
        	  //alert("grid_pagingSt s2_page_st [" + s2_page_st + "] , s2_page_end[" + s2_page_end + "],  page[" +page +"]" );
        	  
        	  search_st2();
          }
    }).on('page', function (event, page) {
        //alert("on2 " + page + ' (from event listening)');
    });
}


function search_st2(){
	//alert("search_st :: cam_id[" + currentValue + "],s1_totalpage[" + s1_totalpage + "], s1_page_st[" + s1_page_st + "], s1_page_end[" + s1_page_end + "]");
	
	var cam_id = currentValue;
	
	var page = new Object();
	page.cam_id = cam_id;
	page.page_st = s2_page_st;
	page.page_end = s2_page_end;
	page.page = s2_totalpage;
	
	$.ajax({
        type    : 'GET', // method
        url     : '/staging/test',
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
        	
        	grid_tableStaging2(obj);
        	
        },
        error : function(request,status,error){
        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});

}

function grid_tableStaging2(obj){
	//alert("grid_table_campaign :: " + obj);
	var div = document.querySelector('#ai_staging_test');
    
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



function submit_addStagingTest(){
//alert('-- submit_newCampagin -- ');
  
// Get form
var form = $('#addUploadForm')[0];
var data = new FormData(form);
$("#bthadd").prop("disabled", true);
$("#bthClose").prop("disabled", true);


$.ajax({
    type: "POST",
    enctype: 'multipart/form-data',
    url: "/file/Upload_StagingTest",
    data: data,
    //http://api.jquery.com/jQuery.ajax/
    //https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects
    processData: false, //prevent jQuery from automatically transforming the data into a query string
    contentType: false,
    cache: false,
    timeout: 600000,
    success: function (data) {
    	   	
    	//console.log("SUCCESS : ", data);
        $("#bthadd").prop("disabled", false);
        
        var jbSplit = data.split('::');
        alert( jbSplit[0] );
        //alert("jbSplit :: " + jbSplit );
        
    	if(jbSplit[0] == "OK"){
    		if(jbSplit[3]=="1")
    		{
    			call_Preprocessor(jbSplit[2]);
    	
    		}
    		else{
    			call_Predict(jbSplit[2]);
    		}
    	}
    },
    error: function (e) {
        alert("error :: " + e.responseText);
        console.log("ERROR : ", e);
        $("#bthNew").prop("disabled", false);
        }
    });
}

function call_Preprocessor(data)
{
	var form = $('#addUploadForm')[0];
	$("#bthNew").prop("disabled", true);
	$("#bthClose").prop("disabled", true);
	var campaign = new Object();
  	campaign.src_id = data;
  	var jsonData = JSON.stringify(campaign);
	$.ajax({
	    type: "POST",
	    dataType: 'JSON',
	    //url: "http://targetai.iptime.org:5000/preprocess",
	    url:"http://localhost:5000/preprocess",
	    processData: false, //prevent jQuery from automatically transforming the data into a query string
	    contentType: 'application/json; charset=utf-8',
	    cache: false,
	    async   : 'true', // true
	    timeout: 600000,
	    data:jsonData,
	    //http://api.jquery.com/jQuery.ajax/
	    //https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects
	    
	    success: function (data) {
	    	
	    	var obj = JSON.stringify(data, true, 2);
        	
        	var json = $.parseJSON(obj);
        	//console.log("SUCCESS : ", data);
            $("#bthadd").prop("disabled", false);
            $("#bthClose").prop("disabled", false);
        	if(json["result_cd"] == "0000"){
        		//alert('모달 종료.');
                form.reset();
                $('#addModal').modal('hide');
        	    
        	    // alert('캠페인 리프리시');
        	    //campaignPage();
                newCampaignPage();
	    	}


	    },
	    error: function (e) {
	        alert("error :: " + e.responseText);
	        console.log("ERROR : ", e);
	        $("#bthNew").prop("disabled", false);
	        }
	    });

}
function call_Predict(data)
{
	var form = $('#addUploadForm')[0];
	$("#bthNew").prop("disabled", true);
	$("#bthClose").prop("disabled", true);
	var campaign = new Object();
  	campaign.src_id = data;
  	var jsonData = JSON.stringify(campaign);
	$.ajax({
	    type: "POST",
	    dataType: 'JSON',
	    //url: "http://targetai.iptime.org:5000/preprocess",
	    url:"http://localhost:5000/predictservice_ml",
	    processData: false, //prevent jQuery from automatically transforming the data into a query string
	    contentType: 'application/json; charset=utf-8',
	    cache: false,
	    async   : 'true', // true
	    timeout: 600000,
	    data:jsonData,
	    //http://api.jquery.com/jQuery.ajax/
	    //https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects
	    
	    success: function (data) {
	    	
	    	var obj = JSON.stringify(data, true, 2);
        	
        	var json = $.parseJSON(obj);
        	//console.log("SUCCESS : ", data);
            $("#bthadd").prop("disabled", false);
            $("#bthClose").prop("disabled", false);
        	if(json["result_cd"] == "0000"){
        		//alert('모달 종료.');
                form.reset();
                $('#addModal').modal('hide');
        	    
        	    // alert('캠페인 리프리시');
        	    //campaignPage();
                newCampaignPage();
	    	}


	    },
	    error: function (e) {
	        alert("error :: " + e.responseText);
	        console.log("ERROR : ", e);
	        $("#bthNew").prop("disabled", false);
	        }
	    });

}
