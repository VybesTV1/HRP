var billiardresourcename = "rtx_billiard";

function closeMain() {
	$("body").css("display", "none");
}

function openMain() {
	$("body").css("display", "block");
}

$(".closechoose").click(function () {
	$.post('https://'+billiardresourcename+'/close', JSON.stringify({}));
});

window.addEventListener('message', function (event) {

	var item = event.data;
	if (item.message == "infonotifyshow") {
		document.getElementsByClassName("infonotifytext")[0].innerHTML = item.infonotifytext;
		openMain();
		$("#infonotifyshow").show();	
	}
	
	if (item.message == "hide") {
		$("#infonotifyshow").hide();	
	}	
	
	if (item.message == "billiardprogressshow") {
		openMain();
		var keytext1 = item.billiardreactkey;
		if (keytext1 == "RETURN") {	
			keytext1 = "ENTER";	
		}					
		document.getElementById("billiardreactkey").innerHTML = keytext1;
		$("#billiardkeyshow").hide();
		$("#billiardprogressshow").show();	
	}	
	
	if (item.message == "billiardprogresshide") {
		$("#billiardprogressshow").hide();	
	}	

	if (item.message == "billiardprogressupdate") {
		$('.billiardprogressbarmaincontainerdata').css("height", item.progressbardata2+"%")
	}		
	
	if (item.message == "billiardkeyinterfaceshow") {
		openMain();
		$("#billiardchangeshow").hide();	
		var keytext1 = item.billiardkeykeysdata1;
		if (keytext1 == "RETURN") {	
			keytext1 = "ENTER";	
		}		
		var keytext2 = item.billiardkeykeysdata2;
		if (keytext2 == "RETURN") {	
			keytext2 = "ENTER";	
		}	
		var keytext3 = item.billiardkeykeysdata3;
		if (keytext3 == "RETURN") {	
			keytext3 = "ENTER";	
		}					
		document.getElementById("billiardkeykeysdata1").innerHTML = keytext1;
		document.getElementById("billiardkeykeysdata2").innerHTML = keytext2;
		document.getElementById("billiardkeykeysdata3").innerHTML = keytext3;
		if (item.billiardkeychange == true) {	
			$("#billiardkeychangeshow").show();	
		} else {
			$("#billiardkeychangeshow").hide();
		}			
		$("#billiardkeyshow").show();		
	}		
	
	if (item.message == "billiardkeyinterfacehide") {
		$("#billiardkeyshow").hide();	
	}		
	
	if (item.message == "billiardchangeshow") {
		openMain();
		var keytext1 = item.billiardchangekey;
		if (keytext1 == "RETURN") {	
			keytext1 = "ENTER";	
		}			
		document.getElementById("billiardchangekey").innerHTML = keytext1;
		$("#billiardchangeshow").show();
	}		
	
	if (item.message == "billiardchangehide") {
		$("#billiardchangeshow").hide();	
	}	

	
	if (item.message == "billiardchooseshow") {
		openMain();
		$("#billiardchooseshow").show();
	}		
	
	if (item.message == "billiardchoosehide") {
		$("#billiardchooseshow").hide();	
	}			
	
	if (item.message == "updateinterfacedata") {
		billiardresourcename = item.billiardresourcenamedata;
		let root = document.documentElement;
		root.style.setProperty('--color', item.interfacecolordata);	
	}	
});

$(".buttonchoose1").click(function () {
	$.post('https://'+billiardresourcename+'/choose1', JSON.stringify({}));
});

$(".buttonchoose2").click(function () {
	$.post('https://'+billiardresourcename+'/choose2', JSON.stringify({}));
});