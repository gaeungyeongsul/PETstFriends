<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오타 qna</title>
<link rel="stylesheet" type="text/css"
   href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
<link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
<link rel="stylesheet" href="./Boot/css/animate.min.css">
<link rel="stylesheet" href="./Boot/css/owl.carousel.css">
<link rel="stylesheet" href="./Boot/css/owl.theme.css">
<link rel="stylesheet" href="./Boot/css/slicknav.css">
<link rel="stylesheet" href="./Boot/style.css">
<link rel="stylesheet" href="./Boot/css/responsive.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
button{
   border: 0;
   /* opacity: 0.5; */
   color: balck;
   background: #00ff0000;
   float: right;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
   crossorigin="anonymous"></script>
<script type="text/javascript">
   $(document).ready(function() {
      var commentDis = function(){
         if(${qnA.qnA_reply == null }){
            $('#replyBox').css('display', 'inline');
            $('#replySucBox').css('display', 'none');
         }else{
            $('#replyBox').css('display', 'none');
            $('#replySucBox').css('display', 'inline');
         }
      }
      commentDis();
      var commentContent = '${qnA.qnA_reply}';
      $('#replyBtn').click(function(){
         var qnA_reply = $('#qnA_reply').val();
         commentContent = qnA_reply;
         $.ajax({
            type : 'GET',
            url : 'writeQnAComment.do',
            data : {
               "qnA_reply" : qnA_reply,
               "qnA_boardno" : ${qnA_boardno}
            },
            success : function(data) {
               $('#replySucBox').css('display', 'inline');
               $('#replySpan').append(qnA_reply);
               $('#qnA_reply').empty();
               $('#replyBox').css('display', 'none');
               
            },
            error : function(xhrReq, status, error) {
               alert(error)
            }
         });
      })
      
      $('#modifyCom').click(function(){
         alert(commentContent)
         $('#replyBox').css('display', 'inline');
         $('#replySpan').empty();
         $('#replySucBox').css('display', 'none');
         $('#qnA_reply').val(commentContent)
      })
      
      $('#deleteCom').click(function(){
         var result = confirm('삭제하시겠습니까?');
         if(result){
         $.ajax({
            type : 'GET',
            url : 'writeQnAComment.do',
            data : {
               "qnA_boardno" : ${qnA_boardno}
            },
            success : function(data) {
               $('#replyBox').css('display', 'inline');
               $('#replySpan').empty();
               $('#replySucBox').css('display', 'none');
               commentContent = '';
               $('#qnA_reply').val(commentContent);
            },
            error : function(xhrReq, status, error) {
               alert(error)
            }
         });
         }else{
         }
      })
      
      $('.deleteBtn').click(function(){
         var result = confirm('삭제하시겠습니까?');
         if(result){
            location.href='deleteQnABoard.do?qnA_boardno='+${qnA_boardno};
         }
         else{
         }
      })
      
   });
</script>
</head>
<body>
   <%@ include file="/petst/header.jsp"%>
   <div class="wrapper">
   <div class="container" style="border: 1px solid white; width:1200px;">
      <div class="main-content">
         <div class="container1" style="background: white;">
            <div class="col-md-4 col-sm-5"
               style="display: inline-block; width: 20%;">
               <div class="widget">
                  <h3>고객센터</h3>
                  <ul>
                     <li><a href="showNoticeList.do">공지사항</a></li>
                        <li><a href="showOftenQnAList.do">자주하는 질문</a></li>
                        <li><a href="qnA.do">1:1 문의</a></li>
                  </ul>
               </div>
            </div>




            <div class="col-md-8 col-sm-8"
               style="border-left: 1px solid gray; width: 80%; display: inline-block;">
               <div style="border-bottom: 2px solid brown; width: 20%;">
               <div style="border-bottom: 5px solid #FFD232; width: 70%;">
                              <div style="border:1px solid white ;  height: 50px; ">
               <h2 align="left"><font style="font-family: 'NanumSquareRound', sans-serif ;font-size:20px;"> <b>1:1 문의</b> </font></h2>
               </div>
               </div>
               </div>
               <div style="height: 20px;"></div>
               
                              <div style="height: 200px; ">
                  <div style="display: inline-block; height:500px; width: 800px; text-align: right; border: 1px solid red;">
         <table class="table" >
            <tr align="center" style="font-family: 'monaco';" bgcolor="white">
            <td style="width: 45px"></td>
               <td style="width: 400px; text-align: left;"><b>${qnA.qnA_title  }</b></td>
               <td style="width: 100px">${qnA.qnA_userId}</td>
               <td style="width: 200px">${qnA.qnA_writeDate }   <c:set var="str1" value="${qnA.qnA_writeDate }"/>
                  </td>               
            </tr> 
            <tr>
            <td></td>
               <td align="left" colspan="5" style="height: 200px; width:700px; ">
               <br><br>
                  ${qnA.qnA_content } <br> <br> <br>
                  </td>
                  </tr>
         </table>
               <br>
            </div>
            </div>
            

                     <div class="bottom-comment" style="background-color: #FAFAFA; height: 250px;; width: 798px;">
            
               <div class="leave-comment" style="width: 100%; border: none;"> 
                  <div id="replyBox">
                           <div class="form-group" >
                              <div class="col-md-12" style="display: inline-block; width: 730px; padding:0;">
                                 <textarea class="form-control" rows="5" id="qnA_reply"
                                    name="qnA_reply" style="margin:0"></textarea>
                              </div>
                              <div style=" display: inline-block; width : 100%; padding: 0;">
                              <br>
                           <button type="button" id="replyBtn" style="width: 80px;">답하기</button>
                           <button class="deleteBtn">글 삭제</button>
                        
                           <button onclick="location.href='showQnAList.do?page=${page }&boardname=${boardname }'
                           +'&type=${type }&keyword=${keyword }&numb=${numb }'">글 목록</button> 
                           </div>
                           </div>
                        </div>
                     <div id="replySucBox" >
                        <span id="replySpan" style="width: 600px; height: 150px;">
                        ${qnA.qnA_reply }
                        </span> 
                        <br>
                        <button id="deleteCom">답변 삭제하기</button>
                        <button id="modifyCom">답변 수정하기</button>
                        <button class="deleteBtn">글 삭제하기</button>
                  <button onclick="location.href='showQnAList.do?page=${page }&boardname=${boardname }'
                      +'&type=${type }&keyword=${keyword }&numb=${numb }'">글 목록으로</button>
                         <button type ="button" onclick="history.back();" >뒤로가기</button> 
                      <br> 
                      <br> 
                      </div> 
                      </div> 
            
         </div>

            </div>
         </div>
      </div>
      </div>
      </div>
      <%@ include file="/petst/footer.jsp"%>
</body>
</html>