$(document).ready(function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    locale: 'ko',
    headerToolbar: {
      left: '',
      center: '',
      right: 'prev,title,next'
    },
    initialDate: '2023-01-12',
    navLinks: true,
    editable: true,
    dayMaxEvents: true,
    events: eventObj,
    initialView: 'dayGridMonth' 
  });


  $('.tab1').click(function() {
    calendar.changeView('dayGridMonth');
  });

  
  $('.tab2').click(function() {
    calendar.changeView('listMonth');
  });

  calendar.render();
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
        
    ]

