/**
 * 재료 용량
 * 재료 구매시 구매 단위 나열 
 */
$( function() {
	 $("#item").change(function() {
		let selectedVal = $(this).val();
		//alert(selectedVal);
		
		let itemA =["100"];
		let itemB =["200"];
		let itemC =["500"];
		let itemD =["545"];
		let itemE =["800"];
		let itemF =["1000"];
		let itemG =["1800"];
		let itemH =["2000"];
		let itemI =["2270"];
		let itemJ =["2300"];
		let itemK =["500","1000"];
		let itemL =["500","800","1000"];
		let d = "";
		switch(selectedVal) {
			case "in_020":
				d = itemA;
			break;
			case "in_009": case "in_019":
				d = itemB;
			break;
			case "in_014":
				d = itemC;
			break;
			case "in_015":
				d = itemD;
			break;
			case "in_003": case "in_004": case "in_005": case "in_006": case "in_007": case "in_008": case "in_010": case "in_011": case "in_013": case "in_017": case "in_018": case "in_021": case "in_022": case "in_023": case "in_024": case "in_025": case "in_026":
				d = itemF;
			break;
			case "in_016":
				d = itemG;
			break;
			case "in_002":
				d = itemH;
			break;
			case "in_028":
				d = itemI;
			break;
			case "in_012":
				d = itemJ;
			break;
			case "in_001":
				d = itemK;
			break;
			case "in_027":
				d = itemL;
			break;
			default:
				d = "";
			break;
		}
		
		$("#content").empty();
		
		for ( x in d) {
			let opt = $("<option value='"+d[x]+"'>"+d[x]+"</option>");
			$("#content").append(opt);
		}    
	});
});	