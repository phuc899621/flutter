import 'dotenv/config';
import axios from 'axios';

class AIServices {
    static async suggestCategories(title) {
        try {
            const response = await axios.post(
                'https://openrouter.ai/api/v1/chat/completions',
                {
                    model: 'meta-llama/llama-3.3-8b-instruct:free',
                    messages: [
                        { role: 'system', content: 'You are a smart assistant. Please answer only in JSON format without any special characters or additional text.' },
                        { role: 'user', content: `Give me a list of 5 suitable categories for the task with title: ${title}. Answer only in JSON format, where the response is in this format:["category1", "category2", "category3", "category4", "category5"] and the each of responses only contain maximum two words. In addition, 3 of the categories must be one word only, other can be two words. No special symbols, no extra text.` }
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
            const cleanJsonString = rawResult.replace(/```json|```/g, '').trim();
            const parsed = JSON.parse(cleanJsonString);
            console.log(parsed);
            return parsed;
        } catch (error) {
            console.error('Call API AI Error:', error?.response?.data || error.message);
        }
    }
}

export default AIServices;