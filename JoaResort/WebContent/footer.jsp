<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<style>
/* .map_wrap {
	display: flex;
	flex-direction: column;
	height: 100%;

}
.footer {
    background-color: lightgreen;
    height: 200px;
    margin-top: auto;
    text-align : center;
} */



.clear:after {content:""; display:block; clear:both;}

footer {/* height:100%;  */
clear : both;
font-family:'Malgun Gothic','맑은 고딕',sans-serif; font-size:16px; letter-spacing:-1px; color:#444; white-space:normal; word-wrap:break-word;}

footer #yakkwan{list-style : none;}
footer #snslist{list-style : none;}

footer .foot_area {box-sizing:border-box; padding:0 20px 90px;}
footer .foot_area h2 {padding-top:15px; font-size:14px;}
footer .foot_area .addr {line-height:1.3; font-size:14px; color:#767676;}
footer .foot_area .copy {padding:3px 0 20px; font-size:14px; color:#767676;}
footer .gubun {color:#fff;}
footer .br_line {display:block;}
/* footer .foot_area .snslink {position:static; width:210px; margin:10px auto;} */
footer .foot_area .snslink li {margin-left:30px;}
footer .foot_area .snslink li:first-child {margin-left:0;} 

footer {border-top:1px solid #ddd;}
footer .foot_area {position:relative; padding-bottom:40px;}
footer .foot_area .foot_list {padding-top:25px;}
footer .foot_area .foot_list li {float:left;}
footer .foot_area .foot_list li:first-child:after {content:"|"; display:inline-block; padding:0 10px; font-size:10px; color:#000; position:relative; top:-2px;}
footer .foot_area .foot_list li a {font-weight:bold; font-size:15px;}
footer .foot_area h2 {padding-top:25px; font-size:14px; color:#666;}
footer .foot_area .addr {padding-top:5px; line-height:1.4; font-size:13px; color:#666;}
footer .foot_area .addr .space0 {letter-spacing: 0;}
footer .foot_area .copy {padding-top:3px; font-size:13px; color:#666; letter-spacing:0;}
footer .foot_area .snslink {position:absolute; right:20px; top:50px;}
footer .foot_area .snslink li {float:left; margin-left:60px;}
footer .foot_area .snslink li a {display:block; width:50px; height:74px; text-indent:-9999px; overflow:hidden; background:url(img/ico_blog_r.png) no-repeat;}
footer .foot_area .snslink li + li a {background-image:url(img/ico_facebook_r.png);}
footer .foot_area .snslink li + li + li a {background-image:url(img/ico_instargram_r.png);}



@media all and (max-width:1065px) and (min-width:769px) {			/* ipad가로, ipadPro가로세로, gallexyTab가로 */
	/* .box_inner {width:100%;}	
    header .header_area h1 {padding-left:20px;}
	.header_cont {float:right; width:60%; padding-right:20px;}		/* gnb 간격 줄임 */
	/*.header_cont .gnb li a {padding:26px 25px;}
	.gnb_depth .submenu_list {width:100%; padding-left:52%;}
    .gnb_depth .submenu_list li a {padding:20px;}                  /* 없으면 395행을 따르게 됨 */
	/*#container {padding-bottom:20px;}
    .about_area .place_list {box-sizing:border-box; padding:0 20px;}
    .appbbs_area .appbbs_box {box-sizing:border-box; padding:0 20px;}
    .appbbs_box .app_line a {font-size:21px;} */
    footer .foot_area {box-sizing:border-box; padding-left:20px;}
    footer .foot_area .snslink li {margin-left:15px;}
   /*  .quick_area .quick_list {display: none;}
    .to_top {position:fixed; right:20px; bottom:112px; text-align:center; background:none; z-index:100;}
	.to_top a {display:block; width:45px; height:45px;  border-left:none; border-bottom:none; background:url(../img/ico_totop_mo.png) no-repeat center; background-size:45px;}
  */
}

@media all and (max-width:768px) {
	
	/* footer */
	footer .foot_area {box-sizing:border-box; padding:0 20px 90px;}
	footer .foot_area h2 {padding-top:15px; font-size:14px;}
	footer .foot_area .addr {line-height:1.3; font-size:14px; color:#767676;}
	footer .foot_area .copy {padding:3px 0 20px; font-size:14px; color:#767676;}
	footer .gubun {color:#fff;}
	footer .br_line {display:block;}
	footer .foot_area .snslink {position:static; width:210px; margin:10px auto;}
    footer .foot_area .snslink li {margin-left:30px;}
	footer .foot_area .snslink li:first-child {margin-left:0;}
}
</style>
</head> 
<body>
<!-- <div>
<footer class="footer">
	<div class="land_information"><a href="http://www.naver.com/policy/service.html" class="land_information_link" target="_blank">이용약관</a>
		<a href="http://land.naver.com/index/declaredArticlePolicy.nhn" class="land_information_link" target="_blank">매물신고운영</a>
		<a href="http://policy.naver.com/rules/privacy.html" class="land_information_link important" target="_blank">개인정보처리방침</a>
		<a href="https://help.naver.com/support/service/main.nhn?serviceNo=746" class="land_information_link" target="_blank">리조트 고객센터</a>
		</div>
		<p class="land_alert">조아리조트 경기도 성남시 분당구 황새울로329번길 5 TEL : (예약문의) 1588-XXXX (현장문의) 031-XXX-XXXX
	</p>
	<div class="land_copyright"><a href="#" target="_blank" aria-label="네이버">
		<i class="icon icon_naver_logo" aria-hidden="true"></i></a>
		Copyright ⓒ <a href="http://www.navercorp.com/ko/index.nhn" target="_blank" class="land_copyright_point">JOAResort Corp.</a> All Rights Reserved.
	</div>
</footer>
</div> -->

<footer>
		<div class="foot_area box_inner">
			<ul class="foot_list clear" id="yakkwan">
				<li><a href="javascript:;">이용약관</a></li>
				<li><a href="javascript:;">개인정보취급방침</a></li>
			</ul>
			<h2>조아리조트</h2>
            <p class="addr">조아리조트 경기도 성남시 분당구 황새울로329번길 5 <span class="gubun">/</span>        
				<span class="br_line">대표전화 <span class="space0">031-XXX-XXXX</span> <span class="gubun">/</span>        
					<span class="br_line">E-mail : <span class="space0"> admin@joaresort.com</span></span>
				</span>
			</p>
			<p class="copy box_inner">Copyright(c) TouristInTour all right reserved</p>
			<ul class="snslink clear" id="snslist">
				<li><a href="javascript:;">blog</a></li>
				<li><a href="javascript:;">facebook</a></li>
				<li><a href="javascript:;">instargram</a></li>
			</ul>
		</div>
</footer>


</body>
</html>