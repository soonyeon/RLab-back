$(document).ready(function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    locale: 'ko',
    headerToolbar: {
      left: '',
      center: '',
      right: 'prev,title,next'
    },
    initialDate: new Date(),
    navLinks: true,
    editable: true,
    dayMaxEvents: true,
    events: eventObj,
    initialView: 'dayGridMonth',
    dateClick: function(info) {
      var dialog = document.getElementById('calendarDialog');
      dialog.showModal();
    },
  });

  $('.tab1').click(function() {
    calendar.changeView('dayGridMonth');
  });

  $('.tab2').click(function() {
    calendar.changeView('listMonth');
  });

  calendar.render();
  
  // 닫기 버튼 클릭 이벤트
  $('#closecalendar').click(function() {
    var dialog = document.getElementById('calendarDialog');
    dialog.close();
  });

  // 이벤트 저장 버튼 클릭 이벤트
  $('#savecalendar').click(function() {
    var eventData = {
      ca_st_num: $('#ca_st_num').val(),
      ca_title: $('#calendarTitle').val(),
      ca_start: $('#calendarStart').val(),
      ca_end: $('#calendarEnd').val(),
      ca_all_day: $('#calendarAllDay').is(':checked') ? 1 : 0
    };
	console.log(eventData);
    $.ajax({
      url: '/rlab/calendar/insert', 
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify(eventData),
      success: function(response) {
        calendar.addEvent(eventData);
        var dialog = document.getElementById('calendarDialog');
        dialog.close();
      },
      error: function(xhr, status, error) {
        alert('이벤트 추가에 실패했습니다.');
      }
    });
  });
});

let eventObj = [
  {
    title: '정처기 필기',
    start: '2023-01-03T12:00:00'
  },
  {
    title: '정처기 접수기간',
    start: '2023-01-10',
    end: '2023-01-15'
  },
  {
    title: '정처기 실기',
    start: '2023-01-29T12:00:00'
  },
];