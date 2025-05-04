require('dotenv').config();
const axios = require('axios');

class AIServices{
    static async suggestCategories(title){
        try {
            const response = await axios.post(
              'https://openrouter.ai/api/v1/chat/completions',
              {
                model: 'deepseek/deepseek-prover-v2:free', // Hoặc 'deepseek-coder' nếu dùng mô hình code
                messages: [
                  { role: 'system', content: 'Tou are a smart assistant' },
                  { role: 'user', 
                    content: 'Give me a list of 5 suitable categories for the task with title:'+
                    title +
                    'in json format, you only need to answer the name of 1 or 2 word each' }
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