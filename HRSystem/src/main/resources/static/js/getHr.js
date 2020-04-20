
//글 삭제 
function delete_row(id,url,tab){
    $.ajax({
        url : url+id,
        type : 'post',
        success : function(data){
            alert('삭제성공');
            clickselectAll(hrid,tab);
        
        }
    });
}

function update_row(data,url){
	
	  $.ajax({
	        url : url,
	        type : 'post',
	        data : data,
	        success : function(data){
	            alert('수정성공');
	        }
	    });
}

function clickselectAll(hrid,tab){
	$.ajax({
        url : '/hr/selectAll_'+tab,
        type : 'post',
        data : {'hrid':hrid},
        success : function(data){
            /* alert('리스트 보기 성공'); */
            var a='';
            
            switch(tab){
            case "edus":
            	$.each(data, function(key,edu){
              
                	
    					a+=`<tr id="row_edu+${edu.id}" class="edus">
    						<td bgcolor="skyblue">
    						</td>
    						<td>
    						<input type="hidden" name="id" value="${edu.id}">
    						<button id="update_edu+${edu.id}" name="update" onclick="clickupdate_edu(${edu.id});" value="off">
    							<img src="/static/img/글 쓰기.png" width="20px" height="20px"/>
    						</button>
    						<button id="delete_edu+${edu.id}" name="delete" onclick="clickdelete_edu(${edu.id});" >
    							<img src="/static/img/삭제.png" width="20px" height="20px"/>
    						</button>
    						</td>
    						<td id="school_edu+${edu.id}" name="schoolname">${edu.schoolname}</td>
    						<td id="major_edu+${edu.id}">${edu.major}</td>
    						<td id="degree_edu+${edu.id}">${edu.degree}</td>
    						<td><input class="enterdate" type="date" id="enter_edu+${edu.id}" name="enterdate" value="${edu.enterdate}" readonly/></td>
    						<td><input class="graduatedate" type="date" id="exit_edu+${edu.id}" name="graduatedate" value="${edu.graduatedate}" readonly/></td>
    						<td id="addr_edu+${edu.id}" name="addr">${edu.addr}</td>
    					</tr>`;
                });
                
               $(".edus").remove();
               $("#rowinsert_edu").before(a);
               break;
            case "careers":
            	/* alert("커리어"); */
            	$.each(data, function(key,career){

    					a+=`<tr id="row_career+${career.id}" class="careers">
							<td bgcolor="skyblue"> </td>
							<td>
							<input type="hidden" name="id" value="${career.id}">
							<button id="update_career+${career.id}" name="update" onclick="clickupdate_career(${career.id});" value="off">
								<img src="/static/img/글 쓰기.png" width="20px" height="20px"/>
							</button>
							<button id="delete_career+${career.id}" name="delete" onclick="clickdelete_career(${career.id});" >
								<img src="/static/img/삭제.png" width="20px" height="20px"/>
							</button>
							</td>
							<td id="companyName_career+${career.id}" name="companyName">${career.companyName}</td>
							<td id="careerRank_career+${career.id}" name="careerRank">${career.careerRank}</td>
							<td id="careerDept_career+${career.id}" name="careerDept">${career.careerDept}</td>
							<td id="work_career+${career.id}" name="work">${career.work}</td>
							<td><input class="enteredDate" type="date" id="enteredDate_career+${career.id}" name="enteredDate" value="${career.enteredDate}" readonly/></td>
							<td><input class="exitedDate" type="date" id="exitedDate_career+${career.id}" name="exitedDate" value="${career.exitedDate}" readonly/></td>
						</tr>
    					`;
                });
                
               $(".careers").remove();
               $("#rowinsert_career").before(a);
            	break;
            case "qualifieds":
            	$.each(data, function(key,career){
            		a+=`<tr id="row_qualified+${qualified.id}" class="qualifieds">
    					<td bgcolor="skyblue"></td>
    					<td>
    					<input type="hidden" name="id" value="${qualified.id}">
    					<button id="update_qualified+${qualified.id}" name="update" onclick="clickupdate_qualified(${qualified.id});" value="off">
    						<img src="/static/img/글 쓰기.png" width="20px" height="20px"/>
    					</button>
    					<button id="delete_qualified+${qualified.id}" name="delete" onclick="clickdelete_qualified(${qualified.id});" >
    						<img src="/static/img/삭제.png" width="20px" height="20px"/>
    					</button>
    					</td>
    					<td id="qualifiedName_qualified+${qualified.id}">${qualified.qualifiedName}</td>
    					<td id="qualifiedNumber_qualified+${qualified.id}">${qualified.qualifiedNumber}</td>
    					<td id="institution_qualified+${qualified.id}">${qualified.institution}</td>
    					<td><input class="acquiDate" type="date" id="enteredDate_qualified+${qualified.id}" name="acquiDate" value="${qualified.acquiDate}" readonly/></td>
    					<td><input class="expiredDate" type="date" id="expiredDate_qualified+${qualified.id}" name="expiredDate" value="${qualified.expiredDate}" readonly/></td>
    				</tr>`;
            	});
            	 $(".qualifieds").remove();
                 $("#rowinsert_qualified").before(a);
            	break;
            default:
            	alert("오작동!!!!");
            	break;
            }
        },
        fail : function(){
        	alert('불러오기 실패');
        }
    });
	
}
				
		function clickupdate_edu(id){
					
					id = "_edu"+id;

					var updateid = "#update"+id;
					var deleteid="#delete"+id;
					var schoolid = "#school"+id;
					var degreeid = "#degree"+id;
					var rowid = "#row"+id
					var enterid = "#enter"+id;
					var exitid="#exit"+id;
					var majorid="#major"+id;
					var addrid="#addr"+id;
					var flag=true;
					
					var school=$(schoolid).text();
					var major=$(majorid).text();
					var degree=$(degreeid).text();
					var addr=$(addrid).text();
					
					if($(updateid).val()=='off'){
						
						$(updateid).val('on');
						flag=true;
					}else{
						$(updateid).val('off');
						flag=false;
					}
					
						if(flag==true){
						console.log("입력가능모드로 전환 :"+id);
						
						$(enterid).removeAttr('readonly');
						$(exitid).removeAttr('readonly');
						
						$(schoolid).html("<input class='update' id='schoolinput"+id+"' type='text' name='schoolname' value='"+school+"' maxlength=5>");
						$(majorid).html("<input class='update' id='majorinput"+id+"' type='text' name='major' value='"+major+"' maxlength=5>");
						$(degreeid).html("<input class='update' id='degreeinput"+id+"' type='text' name='degree' value='"+degree+"' maxlength=5>");
						$(addrid).html("<input class='update' id='addrinput"+id+"' type='text' class='addr' name='addr' value='"+addr+"' maxlength=10>");
						
						flag=false;
						
						}else{
							console.log("입력불가모드로 전환 :"+id);
							
							updatedata = $(rowid+' input[type=text]').serialize()+"&" + $(rowid+' input[type=date]').serialize()
							+"&" +$(rowid+' input[type=hidden]').serialize();
							
							alert(updatedata);
							update_row(updatedata,'/hr/updateEdu');
							
							$(enterid).attr('readonly',true);
							$(exitid).attr('readonly',true);

							$(schoolid).html($("#schoolinput"+id).val());
							$(majorid).html($("#majorinput"+id).val());
							$(degreeid).html($("#degreeinput"+id).val());
							$(addrid).html($("#addrinput"+id).val());
							
							flag=true;
							
						}
			}
				
			
			function clickdelete_edu(id){
				var flag=true;
				var num=id;
				id = "_edu"+id;
					delete_row(num,'/hr/deleteEdu/',"edus");
				/* clickselectAll(hrid); */
					/* $(rowid).remove(); */
			}
			
			function clickinsert_edu(id){
				var nextnum = "_edu"+id;
					console.log('삽입');
					rowid = "#rowinsert_edu";
					var insertdata = $(rowid+' input[type=text]').serialize()+"&" + $(rowid+' input[type=date]').serialize()
					+"&" +$(rowid+' input[type=hidden]').serialize()+"&" +"hrid="+hrid;
					
					alert(insertdata);
					
					$.ajax({
				        url : '/hr/insertEdu',
				        type : 'post',
				        data : insertdata,
				        success : function(insertdata){
				        	
				            alert('삽입성공');
				            clickselectAll(hrid,"edus");
				   
						$("#rowinsert_edu input").val('');
				        }
				    }); 
									
			}

				/* ]]> */

/*경력 CRUD*/
/* <![CDATA[ */
				
		function clickupdate_career(id){
					
					id = "_career"+id;
					var updateid = "#update"+id;
					var deleteid="#delete"+id;
					var companyNameid = "#companyName"+id;
					var careerRankid = "#careerRank"+id;
					var rowid = "#row"+id
					var careerDeptid = "#careerDept"+id;
					var enteredDateid="#enteredDate"+id;
					var exitedDateid="#exitedDate"+id;
					var workid="#work"+id;
					var flag=true;
					
					var companyName=$(companyNameid).text();
					var careerRank=$(careerRankid).text();
					var careerDept=$(careerDeptid).text();
					var work=$(workid).text();
					
					if($(updateid).val()=='off'){
						
						$(updateid).val('on');
						flag=true;
					}else{
						$(updateid).val('off');
						flag=false;
					}
					
						if(flag==true){
						console.log("입력가능모드로 전환 :"+id);
						
						$(enteredDateid).removeAttr('readonly');
						$(exitedDateid).removeAttr('readonly');
						alert(companyNameid);
						$(companyNameid).html("<input class='update' id='companyNameinput"+id+"' type='text' name='companyName' value='"+companyName+"' maxlength=5>");
						$(careerRankid).html("<input class='update' id='careerRankinput"+id+"' type='text' name='careerRank' value='"+careerRank+"' maxlength=5>");
						$(careerDeptid).html("<input class='update' id='careerDeptinput"+id+"' type='text' name='careerDept' value='"+careerDept+"' maxlength=5>");
						$(workid).html("<input class='update' id='workinput"+id+"' type='text' class='work' name='work' value='"+work+"' maxlength=10>");
						
						flag=false;
						
						}else{
							console.log("입력불가모드로 전환 :"+id);
							
							updatedata = $(rowid+' input[type=text]').serialize()+"&" + $(rowid+' input[type=date]').serialize()
							+"&" +$(rowid+' input[type=hidden]').serialize();
							
							alert(updatedata);
							update_row(updatedata,'/hr/updateCareer');
							
							$(enteredDateid).attr('readonly',true);
							$(exitedDateid).attr('readonly',true);

							$(companyNameid).html($("#companyNameinput"+id).val());
							$(careerRankid).html($("#careerRankinput"+id).val());
							$(careerDeptid).html($("#careerDeptinput"+id).val());
							$(workid).html($("#workinput"+id).val());
							
							flag=true;
							
						}
			}
				
			
			function clickdelete_career(id){
				var flag=true;
				num=id;
				id = "_career"+id;
					delete_row(num,'/hr/deleteCareer/',"careers");
					/* $(rowid).remove(); */
			}
			
			function clickinsert_career(id){
				var nextnum = "_career"+id;
					console.log('삽입')
					rowid = "#row"+nextnum;
					rowid="#rowinsert_career";
					
					var insertdata = $(rowid+' input[type=text]').serialize()+"&" + $(rowid+' input[type=date]').serialize()
					+"&" +$(rowid+' input[type=hidden]').serialize()+"&" +"hrid="+hrid;
					
					alert(insertdata);
					
					$.ajax({
				        url : '/hr/insertCareer',
				        type : 'post',
				        data : insertdata,
				        success : function(insertdata){
				            alert('삽입성공');
							clickselectAll(hrid,"careers");
							$("#rowinsert_career input").val('');
				        }
				    }); 
									
			}

				/* ]]> */
/*자격 CRUD*/
/* <![CDATA[ */
				
		function clickupdate_qualified(id){
					id = "_qualified"+id;
					var updateid = "#update"+id;
					var deleteid="#delete"+id;
					var institutionid = "#institution"+id;
					var qualifiedNumberid = "#qualifiedNumber"+id;
					var rowid = "#row"+id
					var qualifiedNameid = "#qualifiedName"+id;
					var acquiDateid="#acquiDate"+id;
					var expiredDateid="#expiredDate"+id;
					var workid="#work"+id;
					var flag=true;
					
					var institution=$(institutionid).text();
					var qualifiedNumber=$(qualifiedNumberid).text();
					var qualifiedName=$(qualifiedNameid).text();
					var work=$(workid).text();
					
					if($(updateid).val()=='off'){
						
						$(updateid).val('on');
						flag=true;
					}else{
						$(updateid).val('off');
						flag=false;
					}
					
						if(flag==true){
						console.log("입력가능모드로 전환 :"+id);
						
						$(acquiDateid).removeAttr('readonly');
						$(expiredDateid).removeAttr('readonly');
						
						$(institutionid).html("<input class='update' id='institutioninput"+id+"' type='text' name='institution' value='"+institution+"' maxlength=5>");
						$(qualifiedNumberid).html("<input class='update' id='qualifiedNumberinput"+id+"' type='text' name='qualifiedNumber' value='"+qualifiedNumber+"' maxlength=5>");
						$(qualifiedNameid).html("<input class='update' id='qualifiedNameinput"+id+"' type='text' name='qualifiedName' value='"+qualifiedName+"' maxlength=5>");
						$(workid).html("<input class='update' id='workinput"+id+"' type='text' class='work' name='work' value='"+work+"' maxlength=10>");
						
						flag=false;
						
						}else{
							console.log("입력불가모드로 전환 :"+id);
							
							updatedata = $(rowid+' input[type=text]').serialize()+"&" + $(rowid+' input[type=date]').serialize()
							+"&" +$(rowid+' input[type=hidden]').serialize();
							
							alert(updatedata);
							update_row(updatedata,'/hr/updateQualified');
							
							$(acquiDateid).attr('readonly',true);
							$(expiredDateid).attr('readonly',true);

							$(institutionid).html($("#institutioninput"+id).val());
							$(qualifiedNumberid).html($("#qualifiedNumberinput"+id).val());
							$(qualifiedNameid).html($("#qualifiedNameinput"+id).val());
							$(workid).html($("#workinput"+id).val());
							
							flag=true;
							
						}
			}
				
			
			function clickdelete_qualified(id){
				var flag=true;
				num=id;
				id = "_qualified"+id;

					delete_row(num,'/hr/deleteQualified/',"qualifieds");
					/* $(rowid).remove(); */
			}
			
			function clickinsert_qualified(id){
				var nextnum = "_qualified"+id;
					console.log('삽입')
					rowid = "#row"+nextnum;
					rowid="#rowinsert_qualified";
					
					var insertdata = $(rowid+' input[type=text]').serialize()+"&" + $(rowid+' input[type=date]').serialize()
					+"&" +$(rowid+' input[type=hidden]').serialize()+"&" +"hrid="+hrid;
					
					alert(insertdata);
					
					$.ajax({
				        url : '/hr/insertQualified',
				        type : 'post',
				        data : insertdata,
				        success : function(insertdata){
				        	
				           /*  alert('삽입성공'); */
				            
				            /*<td bgcolor='skyblue'>${cnt+1}</td>*/
				            var insert_qualified = `
				            	<tr id='row${nextnum}'>
								<td bgcolor='skyblue'></td>
								<td>
								<input type='hidden' name='id' value='${id}'>
								<button id='update${nextnum}' name='update' onclick=\"clickupdate_qualified(${id});\" value='off'>
									<img src="/static/img/글 쓰기.png" width="20px" height="20px"/>
								</button>
								<button id='delete${nextnum}}' name='delete' onclick=\"clickdelete_qualified(${id});\" >
									<img src='/static/img/삭제.png' width='20px' height='20px'/>
								</button>
								</td>
								<td id='qualifiedName_qualified${id}'>${$('#qualifiedNameinsert').val()}</td>
								<td id='qualifiedNumber_qualified${id}'>${$('#qualifiedNumberinsert').val()}</td>
								<td id='institution_qualified${id}'>${$('#institutioninsert').val()}</td>
								<td><input class='acquiDate' type='date' id='acquiDate_qualified${id}' name='acquiDate' value='${$('#acquiDateinsert').val()}' readonly/></td>
								<td><input class='expiredDate' type='date' id='expiredDate_qualified${id}' name='expiredDate' value='${$('#expiredDateinsert').val()}' readonly/></td>
							</tr>`;
							$("#rowinsert_qualified").before(insert_qualified);
							$("#rowinsert_qualified input").val('');
				    		
				        }
				    }); 			
			}