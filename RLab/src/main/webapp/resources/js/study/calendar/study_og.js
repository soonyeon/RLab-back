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
				id: event.ca_st_num,
				title: event.ca_title,
				start: event.ca_start,
				end: event.ca_end,
				allDay: event.ca_all_day === 1,
			};
		});
	}

	// 서버에서 이벤트 데이터를 가져온 후 FullCalendar에 설정함
	fetchEvents().done(function(eventData) {
		console.log(eventData);

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
			events: convertedEventData, // 변환된 이벤트 데이터를 설정함
			initialView: "dayGridMonth",
			dateClick: function(info) {
				var dialog = document.getElementById("calendarDialog");
				dialog.showModal();
			},
		});

		$(".tab1").click(function() {
			calendar.changeView("dayGridMonth");
		});

		$(".tab2").click(function() {
			calendar.changeView("listMonth");
		});

		calendar.render();

		// 닫기 버튼 클릭 이벤트
		$("#closecalendar").click(function() {
			var dialog = document.getElementById("calendarDialog");
			dialog.close();
		});

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
					// 변환된 이벤트 데이터 형식으로 추가함
					var convertedEvent = {
						id: eventData.ca_st_num,
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
	});
});