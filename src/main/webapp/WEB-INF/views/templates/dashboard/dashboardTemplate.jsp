<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<tiles:importAttribute name="javascripts"/>
<tiles:importAttribute name="javascriptsSpecific"/>
<tiles:importAttribute name="stylesheets"/> 
<tiles:importAttribute name="stylesheetsSpecific"/> 

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<meta content="Henry Schein Eai monitor" name="description">

<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>

<!-- stylesheets comun-->
    <c:forEach var="css" items="${stylesheets}">
        <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
    </c:forEach>
<!-- end stylesheets Comun-->
<!-- stylesheets comun-->
    <c:forEach var="cssSpec" items="${stylesheetsSpecific}">
        <link rel="stylesheet" type="text/css" href="<c:url value="${cssSpec}"/>">
    </c:forEach>
<!-- end stylesheets Page Specific-->

</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="mainSidebar" />
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</div>

	
	
	
	<!-- Sparkline 
	<script src="<c:url value="/resources/plugins/sparkline/jquery.sparkline.min.js"/>"></script>-->
	<!-- jvectormap 
	<script src="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"/>"></script>
	<script src="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"/>"></script>-->
	<!-- jQuery Knob Chart 
	<script src="<c:url value="/resources/plugins/knob/jquery.knob.js"/>"></script>-->
	<!-- daterangepicker 
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="<c:url value="/resources/plugins/daterangepicker/daterangepicker.js"/>"></script>-->
	<!-- DataTables 
	<script src="<c:url value="/resources/plugins/datatables/jquery.dataTables.min.js"/>"></script>
	<script src="<c:url value="/resources/plugins/datatables/dataTables.bootstrap.min.js"/>"></script>-->
	
	<!-- Time picker -->
	<!-- bootstrap time picker
	<script src="<c:url value="/resources/plugins/timepicker/bootstrap-timepicker.min.js"/>"></script> -->
	<!-- Bootstrap WYSIHTML5 
	<script src="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"/>"></script>-->
	<!-- Slimscroll 
	<script src="<c:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js"/>"></script>-->
	<!-- FastClick 
	<script src="<c:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>-->
	<!-- AdminLTE App 
	<script src="<c:url value="/resources/dist/js/app.min.js"/>"></script>-->


 
  <!-- Pagination -->
  <!-- <script src="<c:url value="/resources/dist/js/jquery.bootpag.min.js"/>"></script> -->
 <!--<script src="<c:url value="/resources/dist/js/jobs.js"/>"></script>-->
 <!-- <script src="<c:url value="/resources/dist/js/timesheets.js"/>"></script>
 <script src="<c:url value="/resources/dist/js/projectsPlanning.js"/>"></script> -->	
  
  <!-- scripts communs-->
    <c:forEach var="script" items="${javascripts}">
        <script src="<c:url value="${script}"/>"></script>
    </c:forEach>
    <!-- end scripts -->
      <!-- scripts specific-->
    <c:forEach var="Specific" items="${javascriptsSpecific}">
        <script src="<c:url value="${Specific}"/>"></script>
    </c:forEach>
    <!-- end scripts -->
   //
    
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	
</body>

</html>