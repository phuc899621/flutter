import 'dotenv/config';
import axios from 'axios';
import { DateTime } from 'luxon';
import HttpError from '../utils/http.error.js';

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

static async createTaskUsingAi(userInput, categoryList = [],userUtcOffset = '+00:00') {
        try {
            const nowUtc = DateTime.utc();
            console.log('UTC sytem:', nowUtc.toISO());
            console.log('User UTC:', userUtcOffset);
            const userLocalTime = nowUtc.setZone('UTC' + userUtcOffset); // = UTC + offset
            console.log('User local time:', userLocalTime.toISO());
            const systemPrompt = `
You are a smart Task Assistant that helps users create tasks in Vietnamese or English. Convert user's natural language task command into a clean JSON object.

You must calculate the dueDate based on the user's local time, not UTC and return the dueDate in UTC.

Current UTC time is: ${nowUtc.toISO()}
User time zone offset is: ${userUtcOffset}
User local date is: ${userLocalTime.toISO()}

RULES:

1. utcDueDate: 
    - Step 1: If user not mention any date or time, set "dueDate": null.
    - Step 2: Calculate the due date based on the user's local time given above.
    - Step 3: If user mention an expression like "tomorrow", "next week", "next month"... or same meaning in Vietnamese, calculate userLocalDueDate with 00h00 time.
    - Step 4: After calculating, convert it to UTC time using user time zone offset given above so it can be utcDueDate.
    (for example, if user time zone is +04:00, you must subtract 4 hours from userLocalDueDate so it becomes userUtcDueDate).
    - Step 5: Finnally, save utcDueDate in ISO8601 format.
2. hasTime: If the user says a specific time ("9h sáng","same time",...) → set "hasTime": true.
   If no time or time expression mentioned → "hasTime": false.

3. title:  
    - must remove all date/time parts. 
    - Keep only verb or meaningful noun.

4. categoryId: give categoryId which best suitable category name to one from this list: ${JSON.stringify(categoryList)}
   If not found → use category id with name "Any".

5. priority Set "priority": "low", "medium", "high" if user mentioned it. Otherwise: "none".

6. status: Set "status":
   - If dueDate is present → "scheduled"
   - If no dueDate → "pending"

8. Return JSON in exactly this structure and only this structure:
{
  "title": "task title",
  "description": "task description",
  "userLocalDueDate": "ISO8601 datetime in user's local time or null",
  "userUtcDueDate": "ISO8601 datetime in UTC calculated from userLocalDueDate or null",
  "hasTime": true/false,
  "categoryId": "category id from list",
  "priority": "low/medium/high/none",
  "status": "scheduled/pending"
}

Respond with valid pure JSON only. No explanation, no notes.`;

                const userPrompt = `${userInput}`;

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
            throw new HttpError('AI did not return any choices, please  resend your request.',503);
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