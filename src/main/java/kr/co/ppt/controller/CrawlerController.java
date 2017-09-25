package kr.co.ppt.controller;

import java.util.HashMap;
import java.util.Map;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Indexes;

import kr.co.ppt.serviceImpl.CrawlerSerivceImpl;

@Controller
@RequestMapping("/crawler")
public class CrawlerController {
	@Autowired
	CrawlerSerivceImpl cService;

	@RequestMapping("recentNews.json")
	@ResponseBody
	public String recentNews(String newsCode, String num) {
		if (newsCode == null && num == null) {
			return cService.recentNews().toJSONString();
		} else {
			return cService.recentNews(newsCode, Integer.parseInt(num)).toJSONString();
		}
	}
}
