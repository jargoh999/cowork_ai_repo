import require from 'readline'

import {
    GoogleGenerativeAI,
  } from "@google/generative-ai";
  
  const apiKey = 'AIzaSyAv5FsqCkQYzlwMVT2H9R2jzEyvB8vtnFM';
  const model_name=  "gemini-1.5-flash";

 
  async function runChat(prompt){
  const genAI= new GoogleGenerativeAI(apiKey);
  const model = genAI.getGenerativeModel({ model : model_name });

  const generationConfig = {
    temperature: 1,
    topP: 0.95,
    topK: 64,
    maxOutputTokens: 8192,
    responseMimeType: "text/plain",
  };
  

    const chatSession = model.startChat({
      generationConfig,
   // safetySettings: Adjust safety settings
   // See https://ai.google.dev/gemini-api/docs/safety-settings
      history: [
      ],
    });
  
    const result = await chatSession.sendMessage(prompt);
    console.log(result.response.text());
    return result.response.text();
  }
  export default runChat;
  