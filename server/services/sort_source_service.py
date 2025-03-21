from typing import List
# from sentence_transformers import SentenceTransfromer
from sentence_transformers import SentenceTransformer
import numpy as np

class SortSourceService:
    def __init__(self):
        self.embedding_model = SentenceTransformer("all-MiniLM-L6-v2")
    
    def sort_sources(self, query: str, search_results: List[dict]):
        relevant_docs = []
        try: 
         

            # Ensure search results exist
            if not search_results:
               
                return []

            # Generate the query embedding
            query_embedding = self.embedding_model.encode(query)
          

            for res in search_results:
                content = res.get('content', '')
                if not content:
                  
                    continue  # Skip this result

                res_embedding = self.embedding_model.encode(content)
             

                similarity = float(
                    np.dot(query_embedding, res_embedding) /
                    (np.linalg.norm(query_embedding) * np.linalg.norm(res_embedding))
                )

                res['relevance_score'] = similarity
                if similarity > 0.3:
                    relevant_docs.append(res)


            final_result = sorted(relevant_docs, key=lambda x: x['relevance_score'], reverse=True)

            return final_result

        except Exception as e:
            print("Error in sort_sources:", e)
            return []
