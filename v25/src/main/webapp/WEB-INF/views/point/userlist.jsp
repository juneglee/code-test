<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>

<style>

div.info {
 background-color: lightgray;
 width : 400px;
 height: 400px;
}

div.info_lao {
  margin-top: 180px;
  margin-left: 100px;
}
div.dsk_sc {
  width :1140px;
}

div.list_point {
  border: 1px solid;
  height: 50px;
}
div.list_margin{
  margin-top: 10px;
  
}

div.userlist_img {
  width: 200px;
  float:left;
}

div.userlist_price {
  width: 600px;
  float:left;
}

div.userlist_item.no {
  width: 300px;
  float:left;
}

div.userlist_titleName{
  width : 100px;
  text-align: center;
  float:left;
}

div.point_no {
  width: 100px;
  float:left;
}

* {
  margin: 0;
  padding: 0;
}

body {
  margin: 100px;
}

.pop-layer .pop-container {
  padding: 20px 25px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}

</style>

  <!-- Page Content -->
  <div class="wrap">

    <!-- Heading Row -->
    <div class="row align-items-center my-5">
      <div class="col-lg-7">
      
         <table border='1'>
            <tr>
              <th scope="col">포인트 번호</th>
              <th scope="col">유저 번호</th>
              <th scope="col">상대 번호</th>
              <th scope="col">포인트 분류</th>
              <th scope="col">입출금 내용</th>
              <th scope="col">포인트 금액</th>
            </tr>
          <c:set var = "sum" value = "0" />
          <c:forEach items="${userlist}" var="item">
            <tr>
              <td>${item.no}</td> 
              <td>${item.userNo}</td> 
              <td>${item.traderNo}</td> 
              <td>
                <c:if test="${item.pointType==0}">입금</c:if>
                <c:if test="${item.pointType==1}">출금</c:if>
              </td>
              <td><a href='detail?no=${item.no}'>
                <c:choose>
                  <c:when test="${item.content == 1}"> 포인트 적립</c:when>
                  <c:when test="${item.content == 2}"> 포인트 사용</c:when>
                  <c:when test="${item.content == 3}"> 충전 결제 </c:when>
                  <c:when test="${item.content == 4}"> 출금 </c:when>
                </c:choose>
              </td>
              <td>${item.price}</td>
              
              <c:if test="${(item.pointType==0 && item.content == 1) || 
                   (item.pointType==0 && item.content == 3)}">
               <c:set var= "sum" value="${sum + item.price}"/>
              </c:if>
              <c:if test="${(item.pointType==1 && item.content == 2) || 
                   (item.pointType==1 && item.content == 4)}">
               <c:set var= "sum" value="${sum - item.price}"/>
              </c:if>
          </c:forEach>
                 
          </table>
      </div>
      <!-- /.col-lg-8 -->
      <div class="info">
        <div class="info_lao">
         <img src="" alt="기본 이미지"><br>
                 현재 총 포인트는 <c:out value="${sum}"/> 입니다. <br>
          <input id="data-charge-price"  type="text"/><br>           
          <a id="withdraw_addform" class="btn btn-primary" href="#">충전하기</a><br><br>
           <!-- 팝업  -->
          
          <input type="button" value="popup 충전하기" onclick="showPopup();" />
          
          
          <!-- /. 팝업 -->
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Call to Action Well -->
    <div class="card text-white bg-secondary my-5 py-4 text-center">
      <div class="card-body">
            
          <!-- calendar List--> 
          <input id="startDate" type="text" name="startDate" size="12" />
          <input id="calendar" type="button" value="시작" onclick="$('#startDate').datepicker('show');" />

          <input id="endDate" type="text" name="endDate" size="12" />
          <input id="calendar" type="button" value="끝" onclick="$('#endDate').datepicker('show');" />
  
      </div>
    </div>

    <!-- Content Row -->
    <div class="row">
      <div class = "dsk_sc">
              <c:forEach items="${userlist}" var="item">
                <div class="list_point">
                  <div class="list_margin">
                       <div class="userlist">
                          <div class="point_no">
                          <span class="state _statusName">${item.no}</span>
                          </div>
                          <div class="userlist_img">
                           <span><img src="img1.jpg" alt="해당 이미지"></span>
                          </div>
                            <div class="userlist_titleName">
                            <strong>
                                 <c:choose>
                                  <c:when test="${item.content == 1}"> 포인트 적립</c:when>
                                  <c:when test="${item.content == 2}"> 포인트 사용</c:when>
                                  <c:when test="${item.content == 3}"> 충전 결제 </c:when>
                                  <c:when test="${item.content == 4}"> 출금 </c:when>
                                </c:choose>
                            </strong>
                             </div>
                          <div class="userlist_price">
                             <a href="#" class="item_content">
                              <c:if test="${(item.pointType==0 && item.content == 1) || 
								                   (item.pointType==0 && item.content == 3)}">
                                <span class="point1">으로  <strong>${item.price}</strong>가 포인트 <strong>적립</strong>이 되었습니다.</span>
								              </c:if>
								             <c:if test="${(item.pointType==1 && item.content == 2) || 
								                   (item.pointType==1 && item.content == 4)}">
								                <span class="point2">으로  <strong>${item.price}</strong>가 포인트 <strong>사용</strong>이 되었습니다.</span>    
								              </c:if>
                            </a>
                          </div>   
                        </div>
                        <div class="amount_space">
                            <div class="amount_inner">
                                <a href='delete?no=${item.no}' class="point_delete"><button>내역삭제</button></a> 
                            </div>
                        </div>
                     </div>
                 </div>
                </c:forEach>
              
           </div>
    </div>
    <!-- /.row -->
  </div>
  
<!-- 유저 정보 전달 -->
<input id='data-charge-name'  type="hidden" value='${loginUser.name}'/><br>
<input id='data-charge-email'  type="hidden" value='${loginUser.email}'/><br>
<input id='data-charge-Addr'  type="hidden" value='${loginUser.basicAddr}'/><br>
<input id='data-charge-tel'  type="hidden" value='${loginUser.tel}'/><br>
<input id='data-charge-bank'  type="hidden" value='${loginUser.bank}'/><br>
<input id='data-charge-account' type="hidden" value='${loginUser.account}'/><br>
<input id='data-charge-name'  type="hidden" value='${loginUser.name}'/><br>


<input id="data-user-no" type="hidden" value="${loginUser.no}">
<input id="data-trader-no" type="hidden" value="0">
<input id="data-pointType" type="hidden" value="0">
<input id="data-content" type="hidden" value="3">

<!-- 팝업 확인  -->


<!--/. 팝업 확인  -->

<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script>
//  달력 조회 
var startDate = document.querySelector("#data-user-no");
var endDate = document.querySelector("#data-user-no");

//  충전 조회
var a = document.querySelector("#data-user-no");
var b = document.querySelector('#data-trader-no');
var c = document.querySelector('#data-pointType');
var d = document.querySelector('#data-content');

//  충전 값 입력 
var p1 = document.querySelector("#data-charge-price");

//  충전 내부  function 값 조회
var d1 =  document.querySelector("#data-charge-name");
var d2 =  document.querySelector("#data-charge-email");
var d3 =  document.querySelector("#data-charge-Addr");
var d4 =  document.querySelector("#data-charge-tel");

console.log(a);
console.log(b);
console.log(c);
console.log(d);
console.log(p1);
console.log(d1);
console.log(d2);
console.log(d3);
console.log(d4);

// ------------- 더보기 ajax
function moreList(){
    $.ajax({
        url :"/point/userlist",
        type :"POST",
        cache : false,
        dataType:'json',
        data :"userNo="+ a.value, //변경 
        success :function(data){
            console.log(data);
            var userNo="";
            for(var i=0; i<data.hashMapList.length; i++){
                content +=
                "<tr>"+
                    "<td>"+data.hashMapList[i].area+"</td>"+
                    "<td>"+data.hashMapList[i].name+"</td>"+
                    "<td>"+data.hashMapList[i].gubun+"</td>"+
                    "<td>"+data.hashMapList[i].cnt+"</td>"+
                "</tr>";
            }
            content+="<tr id='addbtn'><td colspan='5'><div class='btns'><a href='javascript:moreList();' class='btn'>더보기</a></div>  </td></tr>";
            $('#addbtn').remove();//remove btn
            $(content).appendTo("#table");
        }, error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
    });
};




//충전  function
//-------------------  결제 시스템
document.querySelector("#withdraw_addform").onclick = () => {
   BootPay.request({
        price: p1.value, 
        application_id: "5eba455702f57e00291ee317",
        name: '포인트 충전 결제', //결제창에서 보여질 이름
        pg: 'inicis',
        method: '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
        show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
        items: [
          {
              item_name: '포인트 충전 결제', //상품명
              qty: 1, //수량
              unique: '1234', //해당 상품을 구분짓는 primary key
              price: p1.value, 
              cat1: '포인트 결제 1', 
              cat2: '포인트 결제 2', 
              cat3: '포인트 결제 3', 
          }
        ],
        user_info: {
          username: d1.value,  
          email: d2.value,
          addr: d3.value,
          phone: d4.value
        },
        order_id: d2.value+'_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다. // 생성 
        params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
        account_expire_at: '2020-05-27', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
        extra: {
          start_at: '', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
          end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
          vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
          quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
        }
      }).error(function (data) {
        //결제 진행시 에러가 발생하면 수행됩니다.
        alert(data);
        console.log(data);
      }).cancel(function (data) {
        //결제가 취소되면 수행됩니다.
        console.log(data);
      }).ready(function (data) {
        // 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
        console.log(data);
      }).confirm(function (data) {
        //결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
        //주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
        console.log(data);
        var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
        if (enable) {
          BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
        } else {
          BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
        }
      }).close(function (data) {
          // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
          console.log(data);
          var xhr = new XMLHttpRequest();
          xhr.onreadystatechange = () => {
            if (xhr.readyState != 4 || xhr.status != 200){  
                console.log("withdraw send() 리턴함.");
              } else {
                console.log("withdraw 요청 완료");
              }
          };   
            xhr.open("GET", 
                "<%=request.getContextPath()%>/app/point/add?userNo=" + a.value 
                + "&reviewUserNo=" + b.value
                + "&pointType=" + c.value
                + "&content=" + d.value
                + "&price=" + p1.value, true);
            xhr.send("충전 요청에 성공했습니다.");
      }).done(function (data) {
        //결제가 정상적으로 완료되면 수행됩니다
        //비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
        console.log(data);
      });

}



// -------------------  팝업1

  function showPopup() { 
	window.open(
			"${pageContext.servletContext.contextPath}/WEB-INF/views/point/withdrawAddform.html", 
			"a", "width=400, height=300, left=100, top=50"); 
	}
// -------------------  팝업2

$('#btn-example').click(function(){
        var $href = $(this).attr('href');
        layer_popup($href);
    });
    function layer_popup(el){

        var $el = $(el);        //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });

        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut();
            return false;
        });

    }

 // -------------------  팝업3
    function popup(url, w, h, name, option) {
    var pozX, pozY;
    var sw = screen.availWidth;
    var sh = screen.availHeight;
    var scroll = 0;
    if (option == 'scroll') {
        scroll = 1;
    }
    pozX = (sw - w) / 2;
    pozY = (sh - h) / 2;
    window.open(url, name, "location=0,status=0,scrollbars=" + scroll + ",resizable=1,width=" + w + ",height=" + h + 
    ",left=" + pozX + ",top=" + pozY);
}

 // -------------------  달력
  $(function(){
      $("#startDate").datepicker({
          onSelect:function(dateText, inst) {
              console.log(dateText);
          }
      });
  });
  
  $(function(){
      $("#endDate").datepicker({
          onSelect:function(dateText, inst) {
              console.log(dateText);
          }
      });
  });
  
  ( function( factory ) {
    if ( typeof define === "function" && define.amd ) {
      define( [ "../widgets/datepicker" ], factory );
    } else {
      factory( jQuery.datepicker );
    }
  }( function( datepicker ) {
  datepicker.regional.ko = {
    closeText: "닫기",
    prevText: "이전달",
    nextText: "다음달",
    currentText: "오늘",
    monthNames: [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ],
    monthNamesShort: [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ],
    dayNames: [ "일요일","월요일","화요일","수요일","목요일","금요일","토요일" ],
    dayNamesShort: [ "일","월","화","수","목","금","토" ],
    dayNamesMin: [ "일","월","화","수","목","금","토" ],
    weekHeader: "주",
    dateFormat: "yy-mm-dd", // 변경
    firstDay: 0,
    isRTL: false,
    showMonthAfterYear: true,
    yearSuffix: "년" };
  datepicker.setDefaults( datepicker.regional.ko );
  return datepicker.regional.ko;
  }));
  

  </script>
  
  <!-- /.container -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Footer -->
