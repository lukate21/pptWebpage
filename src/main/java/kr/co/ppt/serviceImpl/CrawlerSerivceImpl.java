package kr.co.ppt.serviceImpl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.springframework.stereotype.Service;

import kr.co.ppt.crawler.DaumNewsDom;
import kr.co.ppt.crawler.NewsCategoryVO;

@Service
public class CrawlerSerivceImpl {

	public JSONArray recentNews(){
		JSONArray arr = new JSONArray();
		try{
			Map<String, String> newsCodeMap = NewsCategoryVO.getTabMap();
			Iterator<String> newsCodeIter = newsCodeMap.keySet().iterator();
			while(newsCodeIter.hasNext()){
				String newsCode = newsCodeIter.next();
				DaumNewsDom daum = new DaumNewsDom();
				daum.setDom(Jsoup.connect(newsCodeMap.get(newsCode)).get());
				List<String> hrefList = daum.getHref();
				DaumNewsDom news = new DaumNewsDom();
				news.setDom(Jsoup.connect(hrefList.get(0)).get());
				Map<String,String> map = new HashMap<>();
				map.put("newsCode", newsCode);
				map.put("title", news.getTitle());
				map.put("link", hrefList.get(0));
				JSONObject obj = new JSONObject(map);
				arr.add(obj);
			}
			DaumNewsDom daum = new DaumNewsDom();
			daum.setDom(Jsoup.connect("http://media.daum.net/").get());
			Map<String,String> map = new HashMap<>();
			map.put("newsCode", "main");
			map.put("title", daum.getHeadTitle());
			map.put("link", daum.getHeadHref().get(0));
			JSONObject obj = new JSONObject(map);
			arr.add(obj);
		}catch(Exception e){
			e.printStackTrace();
		}
		return arr;
	}
	
	public JSONArray recentNews(String newsCode, int num){
		JSONArray arr = new JSONArray();
		String url = newsCode.equals("main")?"http://media.daum.net/":NewsCategoryVO.getTabMap().get(newsCode);
		try{
			DaumNewsDom daum = new DaumNewsDom();
			daum.setDom(Jsoup.connect(url).get());
			List<String> hrefList = newsCode.equals("main")?daum.getHeadHref():daum.getHref();
			Set<String> titleSet = new HashSet<>();
			for(int i=0; i<hrefList.size(); i++){
				DaumNewsDom news = new DaumNewsDom();
				news.setDom(Jsoup.connect(hrefList.get(i)).get());
				Map<String,String> map = new HashMap<>();
				if(titleSet.isEmpty()){
					titleSet.add(news.getTitle());
				}else if(titleSet.contains(news.getTitle())){
					continue;
				}else{
					map.put("newsCode", newsCode);
					map.put("title", news.getTitle());
					map.put("link", hrefList.get(i));
					JSONObject obj = new JSONObject(map);
					arr.add(obj);
					titleSet.add(news.getTitle());
				}
				if(arr.size() == num)
					break;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return arr;
	}
	
	public JSONArray comNews(String comName,int num){
		JSONArray arr = new JSONArray();
		String url = "http://search.daum.net/search?w=news&nil_search=btn&DA=NTB&enc=utf8&cluster=y&cluster_page=1&q="+comName;
		try{
			DaumNewsDom daum = new DaumNewsDom();
			daum.setDom(Jsoup.connect(url).get());
			Map<String,String> searchMap = daum.getSearchHref();
			Iterator<String> iter = searchMap.keySet().iterator();
			while(iter.hasNext()){
				Map<String,String> map = new HashMap<>();
				String key = iter.next();
				map.put("title", key);
				map.put("link", searchMap.get(key));
				JSONObject obj = new JSONObject(map);
				arr.add(obj);
				if(arr.size() == num)
					break;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return arr;
	}
}
