
# 🧠 Perplexity AI Clone - AI Research Assistant
A Learning Project using Python (FastAPI) + Flutter (GetX) + Gemini API + Tavily API


## 🚀 Overview

#### This project is a simplified clone of Perplexity AI, where a user can enter a question, and the app:
1 Uses the Gemini API for LLM-based research.          
2 Performs Web Search using the Tavily API.           
3 Sorts & Compares Data using NumPy & Sentence Transformers.        
4 Displays the Best Answer in a clean, simple UI.        
It's not a full Perplexity clone—it includes only the home screen & answer screen, focusing on AI research capabilities. 
# 📌 Why I Built This Project?
This project is designed to strengthen my expertise in various technologies:  
### 🔥 Flutter & GetX  
✅ Deep understanding of state management in GetX.  
✅ Implemented clean architecture for better project structure.  
✅ Improved my UI/UX design skills.  

### 🐍 Python & FastAPI  
✅ Learned FastAPI for building high-performance web servers.  
✅ Set up virtual environments & API development.  

### 🔍 AI & Web Search  
✅ Integrated Gemini API for AI-based research.  
✅ Used Tavily API to fetch & analyze web search data.  
✅ Applied Sentence Transformers for comparing text.  

## 🛠️ Tech Stack
Frontend (Flutter) 
Framework: Flutter (Dart)  
State Management: GetX  
Architecture: Clean Architecture  
Platform: Web  
Backend (Python)  
Framework: FastAPI    
AI Model: Gemini API  
Search Engine: Tavily API  
Data Processing: NumPy, Sentence Transformers  
# 💡 Features  
✅ Ask AI-powered questions.  
✅ Perform real-time web research.  
✅ Sort & compare data using sentence transformers.  
✅ Simple, minimal Flutter UI.  
✅ Built using clean architecture & best practices.  
## 📌 Future Enhancements
🛠 Enhance UI/UX with more interactive elements.  
📈 Improve answer accuracy using RAG (Retrieval-Augmented Generation).  
🌍 Add multi-language support using GetX.  
🔄 Enable conversation history for better user experience.  

# 📷 Screenshots
Home Page
![home_page](https://github.com/user-attachments/assets/d8558d2e-22bf-4815-9529-cba19d0e4c7a)

![searching_page](https://github.com/user-attachments/assets/ae3106db-f04b-44d2-88ee-c8f968ccbd6b)

Answer Page
![Answer_Page](https://github.com/user-attachments/assets/2ad4c50f-2c9d-4075-b9f8-0374d915bc72)

Video
[!video](https://github.com/user-attachments/assets/157c42f7-d08b-48e0-93c7-c011b0b49fe4)
# 🛠️ Setup & Installation
#### 📌 Backend (FastAPI)  
1. Clone the repo:  
git clone https://github.com/YOUR_USERNAME/perplexity-clone.git     
cd perplexity-clone/server     

2. Set up a virtual environment:    
python -m venv env  
source env/bin/activate  # Mac/Linux    
venv\Scripts\activate     # Windows

3. Install dependencies:
pip install -r requirements.txt

4. Run the FastAPI server:
fastapi dev main.py

#### 📌 Frontend (Flutter)
1. Move to the Flutter directory:
cd perplexity-clone/lib

2. Install Flutter dependencies:
flutter pub get

3. Run the app: 
flutter run -d chrome
