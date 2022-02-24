<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../include/commonCss.jsp" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <style>
  body {
    min-width: 520px;
  }
  .column {
    width: 325px;
    float: left;
    padding-bottom: 100px;
  }
  .portlet {
    margin: 1em 1em 1em 1em;
    padding: 1em;
  }
  .portlet-header {
    padding: 0.2em 0.3em;
    margin-bottom: 0.5em;
    position: relative;
  }
  .portlet-toggle {
    position: absolute;
    top: 50%;
    right: 0;
    margin-top: -8px;
  }
  .portlet-content {
    padding: 0.4em;
  }
  .portlet-placeholder {
    border: 1px dotted black;
    margin: 0 1em 1em 0;
    height: 50px;
  }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( ".column" ).sortable({
      connectWith: ".column",
      handle: ".box-header",
      cancel: ".portlet-toggle",
      placeholder: "portlet-placeholder ui-corner-all"
    });
 
    $( ".box" )
      .addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
      .find( ".box-header" )
        .addClass( "ui-widget-header ui-corner-all" )
        .prepend( "<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");
 
    $( ".portlet-toggle" ).on( "click", function() {
      var icon = $( this );
      icon.toggleClass( "ui-icon-minusthick ui-icon-plusthick" );
      icon.closest( ".box" ).find( ".box-body" ).toggle();
    });
  } );
  
  </script>
</head>
<body>
 
<div class="column">
 
  <div class="box" style="padding:5px;margin:1px">
    <div class="box-header">Feeds</div>
    <div class="box-body"  style="height:175px">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
  </div>
 
  <div class="box" style="padding:5px;margin:1px">
    <div class="box-header">News</div>
    <div class="box-body"  style="height:175px">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
  </div>
 
</div>
 
<div class="column">
 
  <div class="box" style="padding:5px;margin:1px">
    <div class="box-header">Shopping</div>
    <div class="box-body"  style="height:175px">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
  </div>
 
</div>
 
<div class="column">
 
  <div class="box" style="padding:5px;margin:1px">
    <div class="box-header">Links</div>
    <div class="box-body"  style="height:175px">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
  </div>
 
  <div class="box" style="padding:5px;margin:1px">
    <div class="box-header">Images</div>
    <div class="box-body"  style="height:175px">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
  </div>
 
</div>
<div class="column">
         <div class="box" style="padding:5px;margin:1px">
             <div class="box-header">Total Revenue</div>
              <div class="box-body" style="height:175px">
                 <div class="metric-value d-inline-block">
                     <h1 class="mb-1">$12099</h1>
                 </div>
                 <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                     <span><i class="fa fa-fw fa-arrow-up"></i></span><span>5.86%</span>
                 </div>
             	<div id="sparkline-11" class="sparkline-1">
             	</div>
            </div>
         </div>
</div>
	<jsp:include page="../include/commonJs.jsp" />
	<!-- Select2 -->
	<script src="/resources/js/common.js"></script>
 	<script type="text/javascript">
 	 // Sparkline charts
 	  var myvalues = [1000, 1200, 920, 927, 931, 1027, 819, 930, 1021];
 	  $('#sparkline-11').sparkline(myvalues, {
 	    type     : 'line',
 	    lineColor: '#92c1dc',
 	    fillColor: '#ebf4f9',
 	    height   : '50',
 	    width    : '290'
 	  });
 	</script>
</body>
</html>
