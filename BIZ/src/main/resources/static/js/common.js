/**
 *	으 끔직해.......... 
 */

function createMenu(arr){
	var html = "";
	var first = true;
	
	// 데이터 존재 미존재 여부에 따른 표 표시
	if(arr.length != 0) {
		arr.forEach(function(arrVal, arrIdx) {
			if(arr[arrIdx]['level'] == '1'){
				html += "<li class='header'>";
				//1레벨은 클릭 불가 화면으로 제거
				//if(arr[arrIdx]['yn'] == 'Y'){
				//	html += "<a href='javascript:fn_menuOpen("+arr[arrIdx]['menu_url']+");'>";
				//	html += "<span>"+arr[arrIdx]['menu_name']+"</span>";
				//	html += "</a></li>";
				//}else{
				//	html += arr[arrIdx]['menu_name']+"</li>";
				//}
				
				//else 부분만 유지
				html += arr[arrIdx]['menu_name']+"</li>";
			}else if(arr[arrIdx]['level'] == '2'){
				html += "<li";
				if(arr[arrIdx]['yn'] == 'Y'){
					html +="><a href='javascript:fn_menuOpen(\""+arr[arrIdx]['menu_url']+"\");'>";
					html += "<i class='fa fa-circle-o text-aqua'></i><span>"+arr[arrIdx]['menu_name']+"</span>";
					html += "</a></li>";
				}else{
					html += " class='treeview'><a href='#'><span>"+arr[arrIdx]['menu_name']+"</span>"
					html += "<span class='pull-right-container'> <i	class='fa fa-angle-left pull-right'></i></span>";
				
					html += "</a><ul class='treeview-menu'>";
				}
			}else{//3레벨이 최하 레벨이므로 마지막 세팅
				html += "<li class='active'><a href='javascript:fn_menuOpen(\""+arr[arrIdx]['menu_url']+"\");'>";
				html += "<i class='fa fa-circle-o text-aqua'></i>"+arr[arrIdx]['menu_name']+"</a></li>";
				if(arr[arrIdx]['par_menu_no'] != arr[arrIdx+1]['par_menu_no']){
					html += "</ul></li>"
				}
			}
		});	
	}
	
	  	
	$("#trv_main").html(html);					// innerHtml jquery버전
	
}

function searchMenu(arr){
	var html = "";
	var first = true;
	GDS_MENU_DATA = arr;
	console.log("A");
	// 데이터 존재 미존재 여부에 따른 표 표시
	if(arr.length != 0) {
		arr.forEach(function(arrVal, arrIdx) {
			
			var menu_name = arrVal.menu_name;
			var menu_no = arrVal.menu_no;
			var par_menu_no = arrVal.par_menu_no;
			var level = arrVal.level;
			
			var li = '<li id="'+ menu_no +'" lvl="' + level + '"><span style="color:#3c8dbc; cursor:pointer;" onclick="setMenuData('+arrIdx+')">'+ menu_name +'</span></li>';
			//'<li id="20" lvl="2"><a>메인</a></li>'
			//1레벨은 그냥 추가 처리
			if(level  == '1'){
				html += li;
			}else{
				//임시 span 생성
				var test= document.createElement('span');
				var bUlCheck = false;
				test.innerHTML = html;
				var parentLi = test.getElementsByTagName("li");
				for(var i = 0 ;i <parentLi.length ; i++){
					if(parentLi[i].id == par_menu_no){
						var ul = document.createElement('ul');
						ul.innerHTML = li;
						parentLi[i].append(ul);
						bUlCheck = true;
						break;
					}
				}
				
				if(!bUlCheck){
					html += "<ul>" + li + "</ul>";
				}else{
					html = test.innerHTML; 
				}
				
			}
		});	
		
	}
	
	  	
	$("#trv_menu").html(html);					// innerHtml jquery버전
	
}

function transactionPost(url, data, callback){
	$.post(url,data,function(result){
		callback(result);
	});
}

function transactionGet(url, data, callback){
	$.get(url,data,function(result){
		callback(result);
	});
}

/**
 * 문자열이 빈 문자열인지 체크하여 결과값을 리턴한다.
 * @param str       : 체크할 문자열
 */
function isEmpty(str){
    if(typeof str == "undefined" || str == "null" || str == "" || str == "undefined" || str === "undefined")
        return true;
    else
        return false ;
}