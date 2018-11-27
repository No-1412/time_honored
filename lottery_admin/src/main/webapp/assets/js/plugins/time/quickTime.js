requirejs(['jquery'], function($) {
	$('#time_today').on('click', function() {
		if($('#datestart') != null && $('#datestart').length > 0) {
			$('#datestart').val(today);
			$('#dateend').val(today);
		} else {
			$('#timestart').val(today + ' 00:00:00');
			$('#timeend').val(today + ' 23:59:59');
		}
	});
	
	$('#time_yesterday').on('click', function() {
		if($('#datestart') != null && $('#datestart').length > 0) {
			$('#datestart').val(yesterday);
			$('#dateend').val(yesterday);
		} else {
			$('#timestart').val(yesterday + ' 00:00:00');
			$('#timeend').val(yesterday + ' 23:59:59');
		}
	});
	
	$('#time_week').on('click', function() {
		if($('#datestart') != null && $('#datestart').length > 0) {
			$('#datestart').val(weekBegin);
			$('#dateend').val(weekEnd);
		} else {
			$('#timestart').val(weekBegin + ' 00:00:00');
			$('#timeend').val(weekEnd + ' 23:59:59');
		}
	});
	
	$('#time_last_week').on('click', function() {
		if($('#datestart') != null && $('#datestart').length > 0) {
			$('#datestart').val(lastWeekBegin);
			$('#dateend').val(lastWeekEnd);
		} else {
			$('#timestart').val(lastWeekBegin + ' 00:00:00');
			$('#timeend').val(lastWeekEnd + ' 23:59:59');
		}
	});
	
	$('#time_month').on('click', function() {
		if($('#datestart') != null && $('#datestart').length > 0) {
			$('#datestart').val(monthBegin);
			$('#dateend').val(monthEnd);
		} else {
			$('#timestart').val(monthBegin + ' 00:00:00');
			$('#timeend').val(monthEnd + ' 23:59:59');
		}
	});
	
	$('#time_last_month').on('click', function() {
		if($('#datestart') != null && $('#datestart').length > 0) {
			$('#datestart').val(lastMonthBegin);
			$('#dateend').val(lastMonthEnd);
		} else {
			$('#timestart').val(lastMonthBegin + ' 00:00:00');
			$('#timeend').val(lastMonthEnd + ' 23:59:59');
		}
	});
	
	if("undefined" != typeof needSet && needSet == 0) {
	} else {
		if("undefined" != typeof today && today != undefined && today != null) {
			if($('#datestart') != null && $('#datestart').length > 0) {
				$('#datestart').val(today == '' ? yesterday : today);
				$('#dateend').val(today == '' ? yesterday : today);
			} else if($('#timestart') != null && $('#timestart').length > 0){
				$('#timestart').val(today + ' 00:00:00');
				$('#timeend').val(today + ' 23:59:59');
			}
		}
	}
});