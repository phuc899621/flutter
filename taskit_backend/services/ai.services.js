  require('dotenv').config();
  const axios = require('axios');
  const { raw } = require('body-parser');

  class AIServices{
      static async suggestCategories(title){
          try {
              const response = await axios.post(
                'https://openrouter.ai/api/v1/chat/completions',
                {
                  model: 'deepseek/deepseek-prover-v2:free', 
                  messages: [
                    { role: 'system', content: 'You are a smart assistant. Please answer only in JSON format without any special characters or additional text.' },
                    { role: 'user', 
                      content: `Give me a list of 5 suitable categories for the task with title: ${title}. Answer only in JSON format, where the response is in this format: {"categories": ["category1", "category2", "category3", "category4", "category5"]}. No special symbols, no extra text.` }
                  ],
                },
                {
                  headers: {
                    'Authorization': `Bearer ${process.env.OPEN_AI_KEY}`,
                    'Content-Type': 'application/json',
                  },
                }
              );
              const rawResult = response.data.choices[0].message.content;
              console.log(rawResult);
              const cleanJsonString = rawResult.replace(/```json|```/g, '').trim(); // loại bỏ markdown
              const parsed = JSON.parse(cleanJsonString); // phân tích chuỗi JSON
              console.log(parsed);
              return parsed;
            } catch (error) {
              console.error('Lỗi gọi API:', error?.response?.data || error.message);
            }
      }
  }
  module.exports = AIServices;