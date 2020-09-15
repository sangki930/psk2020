<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.text.*"
	
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script>

function submitForm(mode){
	
	//var tmp = document.getElementsByName('itemname')[0].value;//name인 title의 value값 가져오기
	//var tmp1 = document.getElementsByName('itemnum')[0].value;//상품번호 판별
	var tmp = document.getElementsByName('itemname')[0].value;//name인 title의 value값 가져오기
	var tmp1 = document.getElementsByName('itemnum')[0].value;//상품번호 판별
	var tmp2 = document.getElementsByName('stock')[0].value;//재고현황 판별
	var tmp3 = document.getElementsByName('content')[0].value;//상품설명 판별
	
	for(var i=0;i<100;i++){//공백만 있는지 검사
		tmp=tmp.replace(" ","");//공백을 아무것도 없는 걸로 바꾼다.
		tmp3=tmp3.replace(" ","");
	}//i<100은 입력한 길이 만큼 설정
	
	if(mode=="insert"){
		
		if(tmp==""){
			alert('상품명을 입력해야 합니다.');
			
		}else if(tmp1==""){
			alert('상품번호를 입력해야 합니다.');
		}else if(tmp2==""){
			alert('재고현황을 입력해야 합니다.');
		}else if(tmp3==""){
			alert('상품설명을 입력해야 합니다.');
		}
		else{
	fm.action = "stockcheck.jsp";
	fm.submit();
		}
	}
}

function bbsCheck(){ //이미지 사이즈 확인
    if(document.getElementById("selectfile").value!=""){
    var fileSize = document.getElementById("selectfile").files[0].size;//파일 용량
    var maxSize = 16 * 1024 * 1024;//16MB
    if(fileSize > maxSize){
       alert("첨부파일 사이즈는 16MB 이내로 등록 가능합니다.");
       return;
    }
}
}


</script>
<style>
.att{
	background-color : skyblue;
	border-right:1px solid skyblue;
}
.green{
		color : lightgreen;
	}
.noborder{ 
	border: 0;
/*     display: inline-block; */
    
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<meta charset="UTF-8">
<title>stock_insert</title>
<%
request.setCharacterEncoding("UTF-8");
int from=-1;
if(request.getParameter("from1")!=null){
	from=Integer.parseInt(request.getParameter("from1"));
	
}
System.out.println("값 여부:"+from);
%>
</head>
<body>
<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="enrollitem" name="menu"/>
</jsp:include>
<br>
<form method = post name='fm' enctype="multipart/form-data">


<%
out.println("<input type=hidden name='from4' value='"+from+"'>");

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
	//DB에 접속
	String sql = "select * from stock";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery(sql);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date now  = new java.util.Date();//Date d = new Date();로 하면 ambiguous 오류가 나온다.
	String today = sdf.format(now);
 
%>
<table width=700 border=1 style="border-collapse : collapse; border-left:none; border-right:none; font-family : 'Nanum Gothic';" cellpadding=5px>
<tr><td width=100 class="att"><strong>상품 번호</strong></td><td width=150><input type=number name=itemnum size=75 maxlength=75></td></tr>
<tr><td width=100 class="att"><strong>상품명</strong></td><td width=150><input type=text name=itemname size=75 maxlength=75></td></tr>
<tr><td width=100 class="att"><strong>재고 현황</strong></td><td width=150><input type=number name=stock size=75 maxlength=75></td></tr>
<tr><td width=100 class="att"><strong>상품등록일</strong></td><td width=150><input type=hidden name=endate size=75 maxlength=75 
value=<%=today%>><%=today%></td></tr>
<tr><td width=100 height=50 class="att"><strong>상품 설명</strong></td><td width=150>
<textarea style='width:500px; height:250px;' name=content cols=70 row=600 class="DOC_TEXT" placeholder="1000자 이내로 기재해주세요.">

</textarea>
<br />
<span style="color:#aaa;" id="counter">(0 / 최대 1000자)</span>
<script>
//설명란 textarea 체크
$('.DOC_TEXT').keyup(function (e){
    var content = $(this).val();
    $('#counter').html("("+content.length+" / 최대 1000자)");    //글자수 실시간 카운팅

    if (content.length > 1000){
        alert("최대 1000자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 1000));//첨부터 마지막 1000번째까지 글자수 자름
        $('#counter').html("(1000 / 최대 1000자)");//자른 1000자를 기재
    }
});

</script>
 <script type="text/javascript">
    /** 
    onchange event handler for the file input field.
    It emplements very basic validation using the file extension.
    If the filename passes validation it will show the image using it's blob URL  
    and will hide the input field and show a delete button to allow the user to remove the image
    */
	window.onload = () => {
		//() => : 익명함수
		$('#image').on('change', function() {
	        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
	        //split : .을 기준으로 나눔,toLowerCase : 대문자를 소문자로 바꿈(대문자인 확장자는 업로드가 안되기때문)
	        
	        //배열에 추출한 확장자가 존재하는지 체크
	        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	            resetFormElement($(this)); //폼 초기화
	            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
	        } else {
//	         	console.log('여기 들어오나');
	        	if ($('#preview_img')) {
	        		$('#preview_img').remove();
	        	}
	        	
	        	$('#image_preview').append('<img id="preview_img" class="noborder" width=150 height=100 src=""/>');
	            
	        	//document.write("<img border=0 width=150 height=100 />");
	            file = $('#image').prop("files")[0];
	            blobURL = window.URL.createObjectURL(file);
	            $('#preview_img').attr('src', blobURL);
	            //$('#image_preview').slideDown(); //업로드한 이미지 미리보기 
	            //$(this).slideUp(); //파일 양식 감춤
	        }
	    });

	    /*
	   	아래는 remove를 눌렀을시 쓰는 동작
	    */
	    $('#image_preview a').bind('click', function() {
	        resetFormElement($('#image')); //전달한 양식 초기화
	        $('#image').slideDown(); //파일 양식 보여줌
	        $(this).parent().slideUp(); //미리 보기 영역 감춤
	        return false; //기본 이벤트 막음
	    });
	};
    
	    /** 
	    * 폼요소 초기화 
	    * Reset form element
	    * 
	    * @param e jQuery object
	    */
	    
	    function resetFormElement(e) {
	        e.wrap('<form>').closest('form').get(0).reset(); 
	        //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
	        //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
	        //DOM에서 제공하는 초기화 메서드 reset()을 호출
	        e.unwrap(); //감싼 <form> 태그를 제거
	    }
    </script>


</td></tr>

<tr><td width=100 class="att"><strong>상품사진</strong></td>
<td width=150>

    <p>
        <label for="image">이미지 넣기 :</label>
        <br />
        <input type="file" name="selectfile" id="image" />
        
    </p>
  
    <div id="image_preview"></div>
</td></tr>

</table>

<table width=700 cellspacing=10>
	<tr>
		<td width=450></td>
		<td width=50 height=50 align=right  style = "cursor:pointer;" onClick = "window.location='stocklist.jsp?from=1'">
		<p class="far fa-list-alt fa-2x"></p></td>
		<td width=35 height=50 style = "cursor:pointer;" OnClick="submitForm('insert')">
	<p class="fas fa-plus fa-2x green"><br></p>
	</td>
		
	</tr>
</table>

</form>
</body>
</html>