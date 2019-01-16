function writeClick() {
	window.location.href = "write_view.jsp";
}
function listClick() {
	window.location.href = "controller.jspx";
}
function titleClick(bId){
	window.location.href = "controller.jspx?cmd=contents&bId="+bId;	
}

function searchCheck(frm) {
	// 검색
	if (frm.keyWord.value == "") {
		alert("검색 단어를 입력하세요.");
		frm.keyWord.focus();
		return;
	}
	window.location.href = "controller.jspx?cmd=board&keyWord="+$('#keyWord').val()+"&keyField="+$('#keyField').val();
	 
}

$('#keyField').change(function(){
	  $(this).attr("selected","selected");
})

function PageMove(page) {
	 var keyWord = $('#keyWord').val();
     var keyField = $('#keyField').val();
 
	if ($('#keyWord').val()) {
		/*window.location.href = "controller.jspx?cmd=board&page="+page+"&keyWord="+keyWord+"&keyField="+keyField;
		*/   
		
		window.location.href = "controller.jspx?cmd=board&page="+page+"&keyWord="+$('#keyWord').val()+"&keyField="+$('#keyField').val();
		
	}
	window.location.href = "controller.jspx?cmd=board&page="+page+"&keyWord="+$('#keyWord').val()+"&keyField="+$('#keyField').val();

}
