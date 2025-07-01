import 'dotenv/config';
import axios from 'axios';

class AIServices {
    static async suggestCategories(title, excludedCategories=[]) {
        try {
            console.log('Key:', process.env.OPEN_AI_KEY);
            const response = await axios.post(
                'https://openrouter.ai/api/v1/chat/completions',
                {
                    model: 'mistralai/mistral-small-3.2-24b-instruct:free',
                    messages: [
                        { role: 'system', content: 'You are a smart assistant. Please answer only in JSON format without any special characters or additional text' },
                        { role: 'user', content: `Give me a list of 5 suitable categories for the task with title: ${title}. Answer only in JSON format, where the response is in this format:["category1", "category2", "category3", "category4", "category5"] and each of responses only contain maximum two words. In addition, 3 of the categories must be one word only, other can be two words. Also, exclude the following categories: ${excludedCategories}.Upcase each first letter. No special symbols, no extra text.` }
                    ],
                },
                {
                    headers: {
                        'Authorization': `Bearer ${process.env.OPEN_AI_KEY}`,
                        'Content-Type': 'application/json',
                    },
                }
            );

            console.log('[FULL AI RESPONSE]', JSON.stringify(response.data, null, 2));
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

static async parseTaskInfoFromText(userInput, categoryList = []) {
        try {
            const systemPrompt = `
You are a smart assistant. Parse the user's task command into a clean JSON object.
Rules:
- Respond ONLY with pure JSON (no special symbols, no explanation).
today is 2025-30-06, use this time to consider the dueDate ,
- Remove date and time from the title, only verb.
- JSON format:
{
  "title": "task title",
  "dueDate": "ISO8601 datetime (e.g. 2025-07-01T15:00:00)",
  "hasTime": true/false,
  "categoryId": "exactly matched from the list below"
}
- Only respond with valid JSON.`;

            const userPrompt = `Extract task info from this input: "${userInput}"`;

            const response = await axios.post(
                'https://openrouter.ai/api/v1/chat/completions',
                {
                    model: 'mistralai/mistral-small-3.2-24b-instruct:free',
                    messages: [
                        { role: 'system', content: systemPrompt },
                        { role: 'user', content: userPrompt }
                    ],
                },
                {
                    headers: {
                        'Authorization': `Bearer ${process.env.OPEN_AI_KEY}`,
                        'Content-Type': 'application/json',
                    },
                }
            );

            const choices = response?.data?.choices;
            console.log('[AI RAW]:', choices);
    if (!choices || choices.length === 0) {
        throw new Error('AI did not return any choices.');
    }

    const rawResult = choices[0]?.message?.content;
    if (!rawResult) {
        throw new Error('AI response is missing content.');
    }

    console.log('[AI RAW]:', rawResult);
    const cleanJsonString = rawResult.replace(/```json|```/g, '').trim();
    const parsed = JSON.parse(cleanJsonString);
    console.log('[AI Parsed]:', parsed);
    return parsed;
        
        } catch (error) {
            console.error('Call API AI Error:', error?.response?.data || error.message);
        }
    }
}

export default AIServices;