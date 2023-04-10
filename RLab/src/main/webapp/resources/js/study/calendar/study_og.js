$(document).ready(function () {
    var calendarEl = document.getElementById("calendar");

    // 이벤트 데이터를 가져오는 함수
    function fetchEvents() {
        return $.ajax({
            url: "/rlab/calendar/findAll",
            type: "GET",
            dataType: "json",
        });
    }

    // 이벤트 데이터를 변환하는 함수
    function convertEventData(eventData) {
        return eventData.map(function (event) {
            return {
                id: event.ca_num,
                title: event.ca_title,
                start: event.ca_start,
                end: event.ca_end,
                allDay: event.ca_all_day === 1,
            };
        });
    }

    // ca_num 별로 이벤트를 가져오는 함수
    function fetchEventByCaNum(ca_num) {
        return $.ajax({
            url: "/rlab/calendar/findByCaNum/" + ca_num,
            type: "GET",
            dataType: "json",
        });
    }

    // 서버에서 이벤트 데이터를 가져온 후 FullCalendar에 설정함
    fetchEvents().done(function (eventData) {
        // 이벤트 데이터를 변환
        var convertedEventData = convertEventData(eventData);

        // 변환된 이벤트 데이터로 캘린더를 설정함
        var calendar = new FullCalendar.Calendar(calendarEl, {
            locale: "ko",
            headerToolbar: {
                left: "",
                center: "",
                right: "prev,title,next",
            },
            initialDate: new Date(),
            navLinks: true,
            editable: true,
            dayMaxEvents: true,
            events: convertedEventData,
            initialView: "dayGridMonth",
            eventClick: function (info) {
                // 클릭된 이벤트의 ca_num 값을 가져옴
                var ca_num = info.event.id;

                // ca_num 별로 이벤트를 가져옴
                fetchEventByCaNum(ca_num).done(function (eventData) {
                // 이벤트 데이터를 변환
                var convertedEvent = convertEventData([eventData])[0];
				// 콘솔에 변환된 캘린더 정보를 표시함
        		console.log(convertedEvent);

                });
            },
            dateClick: function (info) {
                var dialog = document.getElementById("calendarDialog");
                dialog.showModal();
            },
        });

        calendar.render();

        $(".tab1").click(function () {
            calendar.changeView("dayGridMonth");
        });

        $(".tab2").click(function () {
            calendar.changeView("listMonth");
        });

        // 닫기 버튼 클릭 이벤트
        $("#closecalendar").click(function () {
            var dialog = document.getElementById("calendarDialog");
            dialog.close();
        });
        
        // 이벤트 저장 버튼 클릭 이벤트
        $("#savecalendar").click(function () {
            var eventData = {
                ca_num: $("#ca_num").val(),
                ca_st_num: $("#ca_st_num").val(),
                ca_title: $("#calendarTitle").val(),
                ca_start: $("#calendarStart").val(),
                ca_end: $("#calendarEnd").val(),
                ca_all_day: $("#calendarAllDay").is(":checked") ? 1 : 0,
            };
            console.log(eventData);
            $.ajax({
                url: "/rlab/calendar/insert",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(eventData),
                success: function (response) {
                    // 변환된 이벤트 데이터 형식으로 추가함
                    var convertedEvent = {
                        id: eventData.ca_num,
                        title: eventData.ca_title,
                        start: eventData.ca_start,
                        end: eventData.ca_end,
                        allDay: eventData.ca_all_day === 1,
                    };

                    calendar.addEvent(convertedEvent); // 변환된 이벤트 데이터를 사용하여 이벤트를 추가함
                    var dialog = document.getElementById("calendarDialog");
                    dialog.close();
                },
                error: function (xhr, status, error) {
                    alert("이벤트 추가에 실패했습니다.");
                },
            });
        });
    });
});
