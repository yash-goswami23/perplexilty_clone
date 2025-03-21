from config import Settings
from tavily import TavilyClient
import trafilatura

settings = Settings()
tavily_client = TavilyClient(api_key=settings.TAVILY_API_KEY)
        
class SearchService:
    def web_search(sefl, query: str):
        results = []
        response = tavily_client.search(query)
        search_results = response.get("results",[])
        for result in search_results:
            downloaded = trafilatura.fetch_url(result.get('url'))
            content = trafilatura.extract(downloaded,include_comments=False)
            results.append({
                'title':result.get('title',""),
                'url':result.get('url'),
                'content': content,
            })
        return results