$(document).ready(function() {
    var calendarEl = document.getElementById("calendar");

    // 이벤트 데이터를 가져오는 함수
    function fetchEvents() {
        return $.ajax({
            url: "/RLab/calendar/findAll",
            type: "GET",
            dataType: "json",
        });
    }

    // 이벤트 데이터를 변환하는 함수
    function convertEventData(eventData) {
        return eventData.map(function(event) {
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
        var url = "/RLab/calendar/findByCaNum/" + parseInt(ca_num);
        return $.ajax({
            url: url,
            type: "GET",
            dataType: "json",
        });
    }

    // 서버에서 이벤트 데이터를 가져온 후 FullCalendar에 설정함
    fetchEvents().done(function(eventData) {
        // 이벤트 데이터를 변환
        var convertedEventData = convertEventData(eventData);

        // 변환된 이벤트 데이터로 캘린더를 설정함
        var calendar = new FullCalendar.Calendar(calendarEl, {
            eventDrop: function(info) {
                updateEvent(info.event);
            },
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
            eventClick: function(info) {
                // 클릭된 이벤트의 ca_num 값을 가져옴
                var ca_num = info.event.id;

                // ca_num 별로 이벤트를 가져옴
                fetchEventByCaNum(ca_num).done(function(eventData) {
                    // 이벤트 데이터를 변환
                    var convertedEvent = convertEventData([eventData])[0];

                    // 이벤트 데이터를 입력 필드에 설정
                    $("#editCa_num").val(convertedEvent.id);
                    $("#editCa_st_num").val(eventData.ca_st_num);
                    $("#editCalendarTitle").val(convertedEvent.title);
                    $("#editCalendarStart").val(convertedEvent.start);
                    $("#editCalendarEnd").val(convertedEvent.end);
                    $("#editCalendarAllDay").prop("checked", convertedEvent.allDay);

                    // 수정 및 삭제 모달을 표시함
                    var editDialog = document.getElementById("editCalendarDialog");
                    editDialog.showModal();

                });
            },
            dateClick: function(info) {
                var dialog = document.getElementById("calendarDialog");
                dialog.showModal();
            },
        });

        calendar.render();

        $(".tab1").click(function() {
            calendar.changeView("dayGridMonth");
        });

        $(".tab2").click(function() {
            calendar.changeView("listMonth");
        });

        // 닫기 버튼 클릭 이벤트
        $("#closecalendar, #closeEditCalendar").click(function() {
            var dialog = document.getElementById("calendarDialog");
            dialog.close();

            var editDialog = document.getElementById("editCalendarDialog");
            editDialog.close();
        });

        //UPDATE
     	function updateEvent(event) {
	    var eventData = {
	        ca_num: event.id,
	        ca_title: event.title,
	        ca_start: event.startStr,
	        ca_end: event.endStr ? event.endStr : event.startStr,
	        ca_all_day: event.allDay ? 1 : 0,
	    };
	
	    $.ajax({
	        url: "/RLab/calendar/update/" + eventData.ca_num,
	        type: "PUT",
	        contentType: "application/json",
	        data: JSON.stringify(eventData),
	        success: function(response) {
	            // 이벤트가 성공적으로 업데이트됨
	        },
	        error: function(xhr, status, error) {
	            alert("이벤트 수정에 실패했습니다.");
	        },
	    });
	}

        // 이벤트 저장 버튼 클릭 이벤트
        $("#savecalendar").click(function() {
            var eventData = {
                ca_st_num: $("#ca_st_num").val(),
                ca_title: $("#calendarTitle").val(),
                ca_start: $("#calendarStart").val(),
                ca_end: $("#calendarEnd").val(),
                ca_all_day: $("#calendarAllDay").is(":checked") ? 1 : 0,
            };
            console.log(eventData);
            $.ajax({
                url: "/RLab/calendar/insert",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(eventData),
                success: function(response) {
                    // 새로 생성된 ca_num 값을 가져옴
                    var ca_num = response.ca_num;

                    // 변환된 이벤트 데이터 형식으로 추가함
                    var convertedEvent = {
                        id: ca_num,
                        title: eventData.ca_title,
                        start: eventData.ca_start,
                        end: eventData.ca_end,
                        allDay: eventData.ca_all_day === 1,
                    };

                    calendar.addEvent(convertedEvent); // 변환된 이벤트 데이터를 사용하여 이벤트를 추가함
                    var dialog = document.getElementById("calendarDialog");
                    dialog.close();
                },
                error: function(xhr, status, error) {
                    alert("이벤트 추가에 실패했습니다.");
                },
            });
        });
        // 수정
        $("#updateCalendar").click(function() {
            var eventData = {
                ca_num: $("#editCa_num").val(),
                ca_st_num: $("#editCa_st_num").val(),
                ca_title: $("#editCalendarTitle").val(),
                ca_start: $("#editCalendarStart").val(),
                ca_end: $("#editCalendarEnd").val(),
                ca_all_day: $("#editCalendarAllDay").is(":checked") ? 1 : 0,
            };

            $.ajax({
                url: "/RLab/calendar/update/" + eventData.ca_num,
                type: "PUT",
                contentType: "application/json",
                data: JSON.stringify(eventData),
                success: function(response) {
                    // 해당 이벤트를 찾아서 업데이트함
                    var eventToUpdate = calendar.getEventById(eventData.ca_num);
                    eventToUpdate.setProp("title", eventData.ca_title);
                    eventToUpdate.setDates(eventData.ca_start, eventData.ca_end);
                    eventToUpdate.setAllDay(eventData.ca_all_day === 1);

                    var editDialog = document.getElementById("editCalendarDialog");
                    editDialog.close();
                },
                error: function(xhr, status, error) {
                    alert("이벤트 수정에 실패했습니다.");
                },
            });
        });

        //삭제
        $("#deleteCalendar").click(function() {
            var ca_num = $("#editCa_num").val();

            $.ajax({
                url: "/RLab/calendar/delete/" + parseInt(ca_num),
                type: "DELETE",
                success: function(response) {
                    alert('일정을 삭제했습니다');
                    var eventToDelete = calendar.getEventById(ca_num);
                    eventToDelete.remove();

                    var editDialog = document.getElementById("editCalendarDialog");
                    editDialog.close();
                },
                error: function(xhr, status, error) {
                    alert("이벤트 삭제에 실패했습니다.");
                }
            });
        }); //삭제 클릭 이벤트

    }); // fetchEvents
}); // document