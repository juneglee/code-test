<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
    
</style>

                <input id="start_date" name="startDate" type="hidden" readonly />
                    <input id="end_date" name="endDate" type="hidden" readonly />
                    <div class="date">
                        <a href="javascript:;" id="date_from" class="d_bx"><span id="date_from_notice">2014.09.25</span><span class="ico"></span></a>
                        <span class="dash">~</span>
                        <a href="javascript:;" id="date_to" class="d_bx"><span id="date_to_notice">2014.09.25</span><span class="ico"></span></a>
                        <div id="chku_calendar" class="chku_calendar" style="right:0; top:29px; display:none">
                            <div class="chku_mth">
                                <a href="#" class="calendar-btn-prev-mon">이전</a>
                                <span class="calendar-title-year"></span>
                                <strong class="calendar-title-month m01"><span></span></strong>
                                <a href="#" class="calendar-btn-next-mon">다음</a>
                            </div>
                            <div class="chku_day">
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <thead>
                                    <tr>
                                        <th scope="col"><span>일</span></th>
                                        <th scope="col"><span>월</span></th>
                                        <th scope="col"><span>화</span></th>
                                        <th scope="col"><span>수</span></th>
                                        <th scope="col"><span>목</span></th>
                                        <th scope="col"><span>금</span></th>
                                        <th scope="col"><span>토</span></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="calendar-week">
                                        <td><a class="calendar-date" href="#"></a></td>
                                        <td><a class="calendar-date" href="#"></a></td>
                                        <td><a class="calendar-date" href="#"></a></td>
                                        <td><a class="calendar-date" href="#"></a></td>
                                        <td><a class="calendar-date" href="#"></a></td>
                                        <td><a class="calendar-date" href="#"></a></td>
                                        <td><a class="calendar-date" href="#"></a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>




  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script>
  
  
  var DatePicker = (function() {
	    var _DatePicker = function() {
	        this._$init.apply(this, arguments);
	    };

	    var oDates = {
	        d2YearsAgoDate : undefined,
	        d6MonthsAgoDate : undefined,
	        dNowDate : undefined,
	        htSelectedFromDate : undefined,
	        htSelectedToDate : undefined
	    };

	    var _htCalendarOption = {
	        bUseLayerPosition : false,
	        Calendar : { // 마크업 작성 Calendar Code
	            htCustomEventHandler : {
	                afterDraw : function(oCustomEvent) {
	                    var elTitleOfYear = jindo.$$.getSingle(".calendar-title-year", this.getBaseElement());
	                    var elTitleOfMonth = jindo.$$.getSingle(".calendar-title-month", this.getBaseElement());
	                    var oTemplate = jindo.$Template('<span class="y{=year1}"><span class="hidden">{=year1}</span></span><span class="y{=year2}"><span class="hidden">{=year2}</span></span><span class="y{=year3}"><span class="hidden">{=year3}</span></span><span class="y{=year4}"><span class="hidden">{=year4}</span></span>');
	                    var sYear = oCustomEvent.nYear.toString();
	                    var sMonth = oCustomEvent.nMonth.toString();
	                    if (sMonth < 10) {
	                        sMonth = "0" + sMonth;
	                    }
	                    elTitleOfYear.innerHTML = oTemplate.process({
	                        "year1" : sYear.charAt(0),
	                        "year2" : sYear.charAt(1),
	                        "year3" : sYear.charAt(2),
	                        "year4" : sYear.charAt(3)
	                    });
	                    elTitleOfMonth.className = "calendar-title-month m" + sMonth;
	                    elTitleOfMonth.innerHTML = "";
	                }
	            }
	        }
	    };

	    /**
	     * @param _dCritDate : 기준 날짜
	     * @param _elInput : 값이 노출될 Input Element
	     * @param _elButton : DatePicker Element
	     */
	    var fGetDatePickerOption = function(_dCritDate, _elInput, _elButton) {
	        return {
	            elInput : _elInput,
	            elButton : _elButton,
	            htOption : {
	                nYear : _dCritDate.getFullYear(),
	                nMonth : _dCritDate.getMonth() + 1,
	                nDate : _dCritDate.getDate(),
	                bDefaultSet : true, //true이면 기본 Input 값을 설정한다. false이면 설정하지 않는다.
	                sDateFormat : "yyyy.mm.dd", //input에 입력될 날짜의 형식
	            }
	        };
	    };

	    var fCalendarDrawEvent = function() {
	        j.$ElementList(".month_list>li").removeClass("on");
	    };

	    var fBeforeSelectEvent = function(oCustomEvent) {
	        var _ht2yearsAgoDate = j.Calendar.getDateHashTable(oDates.d2YearsAgoDate),
	            _htNowDate = j.Calendar.getDateHashTable(oDates.dNowDate);

	        var _htSelectedDate = {nYear : oCustomEvent.nYear, nMonth : oCustomEvent.nMonth, nDate : oCustomEvent.nDate};

	        if ( j.Calendar.isBetween(_htSelectedDate, _ht2yearsAgoDate, _htNowDate) === false) {
	            alert("최근 2년 내 내역까지만 조회 가능합니다.");
	            oCustomEvent.stop();
	            return;
	        }
	    };

	    var fSelectEvent = function(oCustomEvent) {
	        var elStartDateInput = j.$("start_date"),
	            elEndDateInput = j.$("end_date");

	        var welStartDateNotice = j.$Element("date_from_notice"),
	            welEndDateNotice = j.$Element("date_to_notice");

	        var _htSelectedDate = {nYear : oCustomEvent.nYear, nMonth : oCustomEvent.nMonth, nDate : oCustomEvent.nDate};

	        if (elStartDateInput.value === elEndDateInput.value) {
	            oDates.htSelectedFromDate = _htSelectedDate;
	            oDates.htSelectedToDate = _htSelectedDate;

	            welStartDateNotice.text(elStartDateInput.value);
	            welEndDateNotice.text(elEndDateInput.value);
	        } else if (elStartDateInput.value === oCustomEvent.sText) {
	            if ( j.Calendar.isFuture(_htSelectedDate, oDates.htSelectedToDate) ) {
	                alert("잘못된 날짜 범위입니다.");
	                elStartDateInput.value = welStartDateNotice.text();
	            } else {
	                oDates.htSelectedFromDate = _htSelectedDate;
	            }
	            welStartDateNotice.text(elStartDateInput.value);
	        } else {
	            if ( j.Calendar.isPast(_htSelectedDate, oDates.htSelectedFromDate) ) {
	                alert("잘못된 날짜 범위입니다.");
	                elEndDateInput.value = welEndDateNotice.text();
	            } else {
	                oDates.htSelectedToDate = _htSelectedDate;
	            }
	            welEndDateNotice.text(elEndDateInput.value);
	        }
	    };

	    _DatePicker.prototype = {
	        _$init : function() {
	            this.initDate();
	            this.drawMonthList();
	            this.addEvent();
	        },
	        drawMonthList : function() {
	            var welMonthList = j.$Element("month_list");

	            for (var i = 5, l = 0; i >= l; i--) {
	                var _dNow = new Date();
	                var _dDate = new Date(_dNow.getFullYear(), _dNow.getMonth() - i, 1);

	                var _month = "<li data-year='" + _dDate.getFullYear() + "' data-month='" + (_dDate.getMonth() + 1)
	                        + "'><a href='#'>" + (_dDate.getMonth() + 1) + "월</a></li>";
	                welMonthList.appendHTML(_month);
	            }
	        },
	        initDate : function() {
	            oDates.dNowDate = new Date();
	            oDates.d6MonthsAgoDate = new Date();
	            oDates.d2YearsAgoDate = new Date();
	            oDates.d6MonthsAgoDate.setMonth(oDates.dNowDate.getMonth() - 6);
	            oDates.d2YearsAgoDate.setMonth(oDates.dNowDate.getMonth() -24);
	            oDates.htSelectedFromDate = {
	                nYear : oDates.d2YearsAgoDate.getFullYear(),
	                nMonth : oDates.d2YearsAgoDate.getMonth() + 1,
	                nDate : oDates.d2YearsAgoDate.getDate()
	            };

	            oDates.htSelectedToDate = {
	                nYear : oDates.dNowDate.getFullYear(),
	                nMonth : oDates.dNowDate.getMonth() + 1,
	                nDate : oDates.dNowDate.getDate()
	            };

	            j.$Element("date_from_notice").text( j.$Date(oDates.d2YearsAgoDate).format("Y.m.d") );
	            j.$Element("date_to_notice").text( j.$Date(oDates.dNowDate).format("Y.m.d") );
	        },
	        addEvent : function() {
	            // Wrapping Date 캘린더 객체 생성
	            var welDatePicker = new j.DatePicker("chku_calendar", _htCalendarOption)
	                    // 조회 시작 (2년전) 날짜 초기화
	                    .addDatePickerSet(fGetDatePickerOption(oDates.d2YearsAgoDate, $("start_date"), $("date_from")))
	                    // 조회 끝 날짜 초기화
	                    .addDatePickerSet(fGetDatePickerOption(oDates.dNowDate, $("end_date"), $("date_to")))
	                    // 캘린더를 그릴 때 월 탭 초기화
	                    .attach("draw", fCalendarDrawEvent)
	                    // 선택 전 Date 범위 체크 Event 할당
	                    .attach("beforeSelect", fBeforeSelectEvent)
	                    // 선택 후 Event
	                    .attach("select", fSelectEvent);

	            j.$Element("month_list").delegate("click", "li", function(e) {
	                j.$ElementList('.month_list>li').removeClass('on');
	                var welList = j.$Element(e.delegatedElement);
	                welList.addClass("on");

	                var _nYear = welList.data("year"),
	                    _nMonth = welList.data("month");

	                var _nLastDate = j.Calendar.getLastDate(_nYear, _nMonth);

	                if (_nMonth == (oDates.dNowDate.getMonth() + 1) && _nYear == oDates.dNowDate.getFullYear()) {
	                    _nLastDate = oDates.dNowDate.getDate();
	                }

	                oDates.htSelectedFromDate = { nYear : _nYear, nMonth : _nMonth, nDate : 1 };
	                oDates.htSelectedToDate = { nYear : _nYear, nMonth : _nMonth, nDate : _nLastDate };

	                welDatePicker.setDate(welDatePicker.getDatePickerSet($("start_date")), oDates.htSelectedFromDate);
	                welDatePicker.setDate(welDatePicker.getDatePickerSet($("end_date")), oDates.htSelectedToDate);
	            });
	        }
	    }

	    return _DatePicker;
	})();

  
  
  
  
  $( function() {
    var dialog, form,
 
      // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
      emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
      name = $( "#name" ),
      email = $( "#email" ),
      password = $( "#password" ),
      allFields = $( [] ).add( name ).add( email ).add( password ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 
    function checkLength( o, n, min, max ) {
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        updateTips( "Length of " + n + " must be between " +
          min + " and " + max + "." );
        return false;
      } else {
        return true;
      }
    }
 
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }
 
    function addUser() {
      var valid = true;
      allFields.removeClass( "ui-state-error" );
 
      valid = valid && checkLength( name, "username", 3, 16 );
      valid = valid && checkLength( email, "email", 6, 80 );
      valid = valid && checkLength( password, "password", 5, 16 );
 
      valid = valid && checkRegexp( name, /^[a-z]([0-9a-z_\s])+$/i, "Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter." );
      valid = valid && checkRegexp( email, emailRegex, "eg. ui@jquery.com" );
      valid = valid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
 
      if ( valid ) {
        $( "#users tbody" ).append( "<tr>" +
          "<td>" + name.val() + "</td>" +
          "<td>" + email.val() + "</td>" +
          "<td>" + password.val() + "</td>" +
        "</tr>" );
        dialog.dialog( "close" );
      }
      return valid;
    }
 
    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      buttons: {
        "Create an account": addUser,
        Cancel: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });
 
    form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      addUser();
    });
 
    $( "#create-user" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
  } );
  </script>
</head>
<body>
 
<div id="dialog-form" title="Create new user">
  <p class="validateTips">All form fields are required.</p>
 
  <form>
    <fieldset>
      <label for="name">Name</label>
      <input type="text" name="name" id="name" value="Jane Smith" class="text ui-widget-content ui-corner-all">
      <label for="email">Email</label>
      <input type="text" name="email" id="email" value="jane@smith.com" class="text ui-widget-content ui-corner-all">
      <label for="password">Password</label>
      <input type="password" name="password" id="password" value="xxxxxxx" class="text ui-widget-content ui-corner-all">
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
</div>
 
 
<div id="users-contain" class="ui-widget">
  <h1>Existing Users:</h1>
  <table id="users" class="ui-widget ui-widget-content">
    <thead>
      <tr class="ui-widget-header ">
        <th>Name</th>
        <th>Email</th>
        <th>Password</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John Doe</td>
        <td>john.doe@example.com</td>
        <td>johndoe1</td>
      </tr>
    </tbody>
  </table>
</div>
<button id="create-user">Create new user</button>
 
 
</body>