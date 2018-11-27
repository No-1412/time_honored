package com.ssc.admin.controller.content;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.entity.IndexScrollImg;
import com.ssc.entity.domain.IndexScrollImgDomain;
import com.ssc.service.content.ScrollImgService;

@Controller
public class IndexScrollImgController extends AdminBaseController {
	@Autowired
	private ScrollImgService scrollImgService;
	
	@RequestMapping(value="/system/scrollImg/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("scrollImg/table", null);
	}
	
	@RequestMapping(value="/system/scrollImg/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		Page<IndexScrollImg> activityPage = baseService.getPage(
			IndexScrollImg.class,
			Collections.singletonList(Where.gt(IndexScrollImgDomain.ID, 0)),
			page == null ? 1 : (page + 1),
			Parameter.orderBy(OrderBy.asc(IndexScrollImgDomain.ORDER))
		);
		return createSuccessModelAndView("scrollImg/page", activityPage);
	}
	
	@RequestMapping(value="/system/scrollImg/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		IndexScrollImg scrollImg = null;
		if(id != null && id > 0L) {
			scrollImg = baseService.getById(IndexScrollImg.class, id, null);
		}
		
		return createSuccessModelAndView("scrollImg/edit", scrollImg);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/scrollImg/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(IndexScrollImg scrollImg) throws Exception {
		scrollImg.setUpdTime(getCurrentDate());
		if(scrollImg.getId() != null && scrollImg.getId() > 0L) {
			scrollImgService.updateScrollImg(scrollImg);
		} else {
			scrollImgService.addScrollImg(scrollImg);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/scrollImg/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		return createSuccessJsonResponse(scrollImgService.deleteScrollImgById(id));
	}
}