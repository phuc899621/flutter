/**
 * @openapi
 * components:
 *   schemas:
 *     Setting:
 *       type: object
 *       properties:
 *         _id:
 *           type: string 
 *           example: "66fdc011c06c8f2361"
 *         userId:
 *           type: string
 *         isNotificationEnabled:
 *           type: boolean
 *           example: true
 *         language:
 *           type: string
 *           example: "en"
 *         theme:
 *           type: string
 *           example: "light"
 *         remindBefore:
 *           type: integer
 *           example: 10
 *         createdAt: 
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z"
 *         updatedAt:
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z"
 *         __v:
 *           type: integer
 *           example: 0 
 *          
 */

/**
 * @openapi
 * components:
 *   schemas:
 *     User:
 *       type: object
 *       properties:
 *         _id:
 *           type: string
 *           example: "66fdc011362027f2361"
 *         name:
 *           type: string
 *           example: "phuc"
 *         email:
 *           type: string
 *           example: "example@example.com"
 *         avatar:
 *           type: string
 *           example: "uploads/image.png"
 *          
 */

/**
 * @openapi
 * components:
 *   schemas:
 *     Task:
 *       type: object
 *       properties:
 *         _id:
 *           type: string
 *           example: "507f1f77bcf86cd799439011"
 *         title:
 *           type: string
 *           example: "Plan trip to Da Nang"
 *         description:
 *           type: string
 *           example: "Book flights, reserve hotel, and create itinerary"
 *         categoryId:
 *           type: string
 *           example: "60df59f2fc13ae1c4e000001"
 *         priority:
 *           type: string
 *           example: "low"
 *         userId:
 *           type: string
 *           example: "6868c0e7a7d"
 *         status:
 *           type: string
 *           example: "scheduled"
 *         dueDate: 
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z"
 *         createdAt:
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z"
 *         updatedAt:
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z"    
 *         __v: 
 *           type: integer
 *           example: 0 
 */
/**
 * @openapi
 * components:
 *   schemas:
 *     TaskWithSubtasks:
 *       allOf:   
 *         - $ref: '#/components/schemas/Task'
 *         - type: object
 *           properties:
 *             subtasks:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Subtask'
 */

/**
 * @openapi
 * components:
 *   schemas:
 *     Category:
 *       type: object
 *       properties:
 *         _id:
 *           type: string
 *           example: "66fdc011c0662027f2361"
 *         name:
 *           type: string
 *           example: "Shopping"
 *         userId:
 *           type: string
 *         createdAt:
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z"
 *         updatedAt:
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z"    
 *         __v: 
 *           type: integer
 *           example: 0 
 */

/**
 * @openapi
 * components:
 *   schemas:
 *     Subtask:
 *       type: object
 *       properties:
 *         _id:
 *           type: objectId
 *           example: "66fdc011c0662027f2361"
 *         title:
 *           type: string
 *           example: "Book flight tickets"
 *         isCompleted:
 *           type: boolean
 *           example: false
 *         taskId:
 *           type: objectId
 *           example: "66fdc011c0662027f2361"
 *         createdAt:
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z"
 *         updatedAt:
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z"    
 *         __v: 
 *           type: integer
 *           example: 0 
 */
//------Error-------------
/**
 * @openapi
 * components:
 *   responses:
 *     500:
 *       description: Internal server error
 *       content:
 *         application/json:
 *           schema: 
 *             type: object
 *             properties:
 *               message:
 *                 type: string
 *                 example: "{Message} Error: {Error}"
 *               data:
 *                 type: object
 *                 example: {}
 */

//bad request

/**
 * @openapi
 * components:
 *   responses:
 *     400:
 *       description: Bad request
 *       content:
 *         application/json:
 *           schema: 
 *             type: object
 *             properties:
 *               message:
 *                 type: string
 *                 example: "{Message} Bad Request: {Error}"
 *               data:
 *                 type: object
 *                 example: {}
 */
//Unauthorized

/**
 * @openapi
 * components:
 *   responses:
 *     401:
 *       description: Unauthorized
 *       content:
 *         application/json:
 *           schema: 
 *             type: object
 *             properties:
 *               message:
 *                 type: string
 *                 example: "Access denied. No authorization provided"
 *               data:
 *                 type: object
 */
//not found

/**
 * @openapi
 * components:
 *   responses:
 *     404:
 *       description: Not found
 *       content:
 *         application/json:
 *           schema: 
 *             type: object
 *             properties:
 *               message:
 *                 type: string
 *                 example: "{Message} Not found"
 *               data:
 *                 type: object
 *                 example: {}
 */