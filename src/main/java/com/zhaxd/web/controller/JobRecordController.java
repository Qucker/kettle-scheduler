package com.zhaxd.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zhaxd.common.toolkit.Constant;
import com.zhaxd.core.dto.BootTablePage;
import com.zhaxd.core.dto.ResultDto;
import com.zhaxd.core.model.KUser;
import com.zhaxd.web.service.JobRecordService;
import com.zhaxd.web.utils.JsonUtils;

@RestController
@RequestMapping("/job/record/")
public class JobRecordController {

	@Autowired
	private JobRecordService jobRecordService;

	@RequestMapping("getList.shtml")
	public String getList(Integer offset, Integer limit, Integer jobId, HttpServletRequest request){
		KUser kUser = (KUser) request.getSession().getAttribute(Constant.SESSION_ID);
//		BootTablePage list = jobRecordService.getList(offset, limit, kUser.getuId(), jobId);
		BootTablePage list = jobRecordService.getList(offset, limit,jobId);
//		使用户可以查看全部调度任务
		return JsonUtils.objectToJson(list);
	}
	@RequestMapping("getAllJobsToday.shtml")
	public String getAllJobsToday(HttpServletRequest request){
		KUser kUser = (KUser) request.getSession().getAttribute(Constant.SESSION_ID);
		return JsonUtils.objectToJson(jobRecordService.getAllJobsToday(kUser.getuId()));
	}

	@RequestMapping("getSuccessJob.shtml")
	public String getSuccessJob(HttpServletRequest request){
		KUser kUser = (KUser) request.getSession().getAttribute(Constant.SESSION_ID);
		return JsonUtils.objectToJson(jobRecordService.getSuccessJob(kUser.getuId()));
	}

	@RequestMapping("getFailJob.shtml")
	public String getFailJob(HttpServletRequest request){
		KUser kUser = (KUser) request.getSession().getAttribute(Constant.SESSION_ID);
		return JsonUtils.objectToJson(jobRecordService.getFailJob(kUser.getuId()));
	}

	@RequestMapping("getLogContent.shtml")
	public String getLogContent(Integer recordId){
		try {
			String logContent = jobRecordService.getLogContent(recordId);
			return ResultDto.success(logContent.replace("\r\n", "<br/>"));
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
}
