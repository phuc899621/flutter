//#region Setting
/**
 * @openapi
 * components:
 *   schemas:
 *     Setting:
 *       type: object
 *       properties:
 *         id:
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
 *          
 */
//#endregion

//#region User
/**
 * @openapi
 * components:
 *   schemas:
 *     User:
 *       type: object
 *       properties:
 *         id:
 *           type: string
 *           example: "66fdc011362027f2361"
 *         username:
 *           type: string
 *           example: "user123"
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
//#endregion

//#region Task
/**
 * @openapi
 * components:
 *   schemas:
 *     Task:
 *       type: object
 *       properties:
 *         id:
 *           type: string
 *           example: "507f1f77bcf86cd799439011"
 *         userId:
 *           type: string
 *           example: "6868c0e7a7ddsas1231231"
 *         categoryId:
 *           type: string
 *           example: "60df59f2fc13ae1c4e000001"
 *         title:
 *           type: string
 *           example: "Plan trip to Da Nang"
 *         description:
 *           type: string
 *           example: "Book flights, reserve hotel, and create itinerary"
 *         priority:
 *           type: string
 *           example: "low"
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
 *     TaskWithLocalId:
 *       allOf: 
 *         - type: int  
 *           properties:
 *             localId:
 *               type: integer
 *               example: 1
 *         - $ref: '#/components/schemas/Task'
 */
//#endregion

//#region TaskWithSubtasks
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


//#region Subtask
/**
 * @openapi
 * components:
 *   schemas:
 *     Subtask:
 *       type: object
 *       properties:
 *         id:
 *           type: string
 *           example: "66fdc011c0662027f2361"
 *         title:
 *           type: string
 *           example: "Book flight tickets"
 *         isCompleted:
 *           type: boolean
 *           example: false
 *         taskId:
 *           type: string
 *           example: "66fdc011c0662027f2361"
 *         createdAt:
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z"
 *         updatedAt:
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z"    
 *     SubtaskWithLocalId:
 *       allOf:
 *         - type: int
 *           properties:
 *             localId:
 *               type: integer
 *               example: 1
 *         - $ref: '#/components/schemas/Subtask'
 */
//#endregion

//#region Category
/**
 * @openapi
 * components:
 *   schemas:
 *     Category:
 *       type: object
 *       properties:
 *         id:
 *           type: string
 *           example: "66fdc011c0662027f2361"
 *         name:
 *           type: string
 *           example: "Shopping"
 *         userId:
 *           type: string
 *           example: "60df59f2fc13ae1c4e000001"
 *         isDefault:
 *           type: boolean
 *           example: false
 *         createdAt:
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z"
 *         updatedAt:
 *           type: string
 *           format: date-time
 *           example: "2025-07-05T06:06:31.213Z" 
 *     CategoryWithLocalId:
 *       allOf:
 *         - type: int
 *           properties:
 *             localId:
 *               type: integer
 *               example: 1
 *         - $ref: '#/components/schemas/Category'
 *    
 */
//#endregion

//#region HTTP response
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
 *                 example: "Something went wrong"
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
 *                 example: "Title is required"
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
 *                 example: "User not found"
 *               data:
 *                 type: object
 *                 example: {}
 */

/**
 * @openapi
 * components:
 *   responses:
 *     409:
 *       description: Conflict
 *       content:
 *         application/json:
 *           schema: 
 *             type: object
 *             properties:
 *               message:
 *                 type: string
 *                 example: "Email already exists"
 *               data:
 *                 type: object
 *                 example: {}
 */
//#endregion