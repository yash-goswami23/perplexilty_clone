import asyncio
from fastapi import FastAPI, WebSocket
from pydantic_models.chat_body import ChatBody
from services.sort_source_service import SortSourceService
from services.search_service import SearchService
from services.llm_service import LLMService

app = FastAPI()


search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()


#chat websocket
@app.websocket("/ws/chat")
async def websocket_cht_endpoint(websocket: WebSocket):
    await websocket.accept()
    try:
        await asyncio.sleep(0.1)
        data = await websocket.receive_json()
        print('i am query of revicer',data)
        query = data.get("query")
        search_results =  search_service.web_search(query)
        # print("i am web search reslut",search_results)
        sorted_results = sort_source_service.sort_sources(query,search_results)
        print("i am sort source reslut")
        await asyncio.sleep(0.1)
        await websocket.send_json({"type": "search_result", "data":sorted_results})
        for chunk in llm_service.generate_response(query, sorted_results):
            await asyncio.sleep(0.1)
            await websocket.send_json({'type': 'content', "data": chunk})
    except Exception as e: 
        print("i am revecer of socket",e)
    finally:
        await websocket.close()


@app.post('/chat')
def chat_endpoint(body: ChatBody):
    try: 
        search_results =  search_service.web_search(body.query)
        print(search_results)
        # sort the sources
        sorted_results = sort_source_service(body.query,search_results)
        print(sorted_results)
        # generate the response using LLM
        response = llm_service.generate_response(body.query, sorted_results)
        print(response)
        return response
    except Exception as e:
        print(e)
