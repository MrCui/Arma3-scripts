/* 公共函数 */

/**
 * @param string  _title      日志标题
 * @param mixed   _content    日志内容
 * @param boolean _showWindow 是否输出到屏幕上, 默认是
 *
 * @return void
 */
log_record = {
	params  ["_title", "_content", ["_showWindow", true]];
	_output = ["%1 : %2", _title, _content];
	if (_showWindow) then {
		hint format _output;
	};

	diag_log format _output;
};
