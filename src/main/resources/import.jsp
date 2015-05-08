<html>
	<head>
		<title>Jahia mass site import</title>
      <script src="javascript/jquery-1.10.2.min.js"></script>
		<script src="javascript/importconfig.js"></script>
		
	</head>
	<body>
		<div id="import_status">Import progres: <span id="import_number"></span></div>
		<iframe src="" name="myframe" id="jahiaAdmin" style="height:80%; width:100%;"></iframe>
		<div id="creation_times"></div>
		<script type="text/javascript"> 
			var importNumber = startNumber;
			var startTime = 0;
			var endTime;
			document.getElementById('jahiaAdmin').src = host+"cms/adminframe/default/fr/settings.webProjectSettings.html";
			$('#jahiaAdmin').load(function() {
				if (importNumber <= endNumber) {
				
					if (window.frames['myframe'].document.forms['sitesForm'] != null) {
						if (startTime > 0) {
							endTime = Math.floor((new Date().getTime() - startTime)/1000);
							document.getElementById("import_number").innerHTML
							document.getElementById("creation_times").innerHTML = document.getElementById("creation_times").innerHTML  + 
														"<div style='float:left; margin:3px; width:150px; border:solid 1px #000000; text-align:center;'>Num"
														+ importNumber + " : " + endTime + " sec</div>";
						} 
						startTime = new Date().getTime();
					    window.frames['myframe'].submitSiteForm('importPrepackaged');
					}					
				}
				if (window.frames['myframe'].document.getElementById('JahiaPerformancesTestsSitesiteTitle') != null) {
					var process = false;
					var inputs, index;
					var regexp = new RegExp("importsInfos");
					inputs = window.frames['myframe'].document.getElementsByTagName('input');
					var process = true;
					window.frames['myframe'].document.getElementById('JahiaPerformancesTestsSitesiteKey').value = siteKey+importNumber;			
					
					if (process) {
						//	window.frames['myframe'].document.forms['main'].submit();
						window.frames['myframe'].document.getElementsByName('_eventId_processImport')[0].click();
						//	alert(window.frames['myframe'].document.forms[0]);
						importNumber++;
					}
				}
			});
		</script>
	</body>
</html>