package kr.kh.RLab.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.kh.RLab.service.CalendarService;
import kr.kh.RLab.service.StudyService;
import kr.kh.RLab.vo.CalendarVO;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/calendar")
public class CalendarController {

	private final StudyService studyService;
	private final CalendarService calendarService;

	@PostMapping("/insert")
	public Map<String, Object> insert(@RequestBody CalendarVO calendarVo) {
	    int ca_num = calendarService.insert(calendarVo);

	    Map<String, Object> response = new HashMap<>();
	    response.put("ca_num", ca_num);

	    return response;
	}

	@GetMapping("/findAll")
	public List<CalendarVO> findAll() {
		return calendarService.findAll();
	}

	@GetMapping("/findByCaNum/{ca_num}")
	public CalendarVO findByCaNum(@PathVariable int ca_num) {
		return calendarService.findCaNum(ca_num);
	}

	@PutMapping("/update/{ca_num}")
	public void update(@PathVariable int ca_num, @RequestBody CalendarVO calendarVo) {
	    calendarService.update(calendarVo);
	}

	@DeleteMapping("/delete/{ca_num}")
	public void delete(@PathVariable int ca_num) {
		calendarService.delete(ca_num);
	}
}
