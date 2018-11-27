package com.ssc.admin.controller.content;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.annotation.Arg;
import com.ssc.core.annotation.Validation;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.entity.News;
import com.ssc.entity.domain.NewsDomain;
import com.ssc.service.content.NewsService;

@Controller
public class NewsController extends AdminBaseController {
	@Autowired
	private NewsService newsService;
	
	@RequestMapping(value="/system/news/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("news/table", null);
	}
	
	@RequestMapping(value="/system/news/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		Page<News> newsPage = baseService.getPage(
			News.class,
			Collections.singletonList(Where.gt(NewsDomain.ID, 0)),
			page == null ? 1 : (page+1),
			Parameter.orderBy(OrderBy.asc(NewsDomain.ORDER))
		);
		
		return createSuccessModelAndView("news/page", newsPage);
	}
	
	@RequestMapping(value="/system/news/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		News news = null;
		if(id != null && id > 0L) {
			news = baseService.getById(News.class, id, null);
		}
		if(news == null) {
			news = new News();
			news.setType("新闻");
			news.setSource("转载");
		}
		
		ModelAndView modelAndView = new ModelAndView("news/edit");
		modelAndView.addObject("content", news.getContent());
		news.setContent(null);
		modelAndView.addObject("news", news);
		
		return modelAndView;
	}
	
	@Validation(
		args={
			@Arg(field=NewsDomain.TYPE, text="类型", maxLength=2),
			@Arg(field=NewsDomain.SOURCE, text="来源", maxLength=2),
			@Arg(field=NewsDomain.TITLE, text="标题", maxLength=40),
			@Arg(field=NewsDomain.ZHAI_YAO, text="摘要", maxLength=200),
			@Arg(field=NewsDomain.CONTENT, text="内容")
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/news/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(News news) throws Exception {
		news.setUpdTime(getCurrentDate());
		if(news.getId() != null && news.getId() > 0L) {
			newsService.updateNews(news);
		} else {
			news.setAddTime(news.getUpdTime());
			newsService.addNews(news);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/news/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		newsService.deleteNewsById(id);
		
		return createSuccessJsonResponse(null);
	}
}