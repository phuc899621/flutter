import CategoryServices from "./category.services.js";
import CategorySyncService from "./category.sync.service.js";
//#region CREATE
export const createCategory = async (req, res, next) => {
  try {
    const userId = req.user.userId;
    console.log(userId, req.body);
    const result = await CategoryServices.createCategory(userId, req.body);
    CategorySyncService.notifyCreate(userId, result);
    return res.status(201).json({
      message: "Category created successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
//#endregion

//#region READ
export const getCategories = async (req, res, next) => {
  try {
    const userId = req.user.userId;
    const lastSyncTime = req.query.lastSyncTime;
    console.log(userId, lastSyncTime);
    const categories = await CategoryServices.getCategories(
      userId,
      lastSyncTime,
    );
    return res.status(200).json({
      message: "Categories retrieved successfully",
      data: categories,
    });
  } catch (e) {
    next(e);
  }
};
export const pullCategories = async (req, res, next) => {
  try {
    const userId = req.user.userId;
    const lastSyncTime = req.query.lastSyncTime;
    console.log(userId, lastSyncTime);
    const categories = await CategoryServices.pullCategories(
      userId,
      lastSyncTime,
    );
    return res.status(200).json({
      message: "Categories pull successfully",
      data: categories,
    });
  } catch (e) {
    next(e);
  }
};
export const getCategory = async (req, res, next) => {
  try {
    const { id } = req.params;
    const userId = req.user.userId;
    const category = await CategoryServices.getCategory(userId, id);
    return res.status(200).json({
      message: "Category retrieved successfully",
      data: category,
    });
  } catch (e) {
    next(e);
  }
};
//#endregion
//#region UPDATE
export const updateCategoryFull = async (req, res, next) => {
  try {
    const { id } = req.params;
    const userId = req.user.userId;
    const result = await CategoryServices.updateCategoryFull(
      userId,
      id,
      req.body,
    );
    return res.status(200).json({
      message: "Category updated successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
export const updateCategoryPartial = async (req, res, next) => {
  try {
    const { id } = req.params;
    const userId = req.user.id;
    const result = await CategoryServices.updateCategoryPartial(
      userId,
      id,
      req.body,
    );
    return res.status(200).json({
      message: "Category updated successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
export const syncCategories = async (req, res, next) => {
  try {
    const { categories } = req.body;
    const userId = req.user.userId;
    const result = await CategoryServices.syncCategories(userId, categories);
    return res.status(200).json({
      message: "Category synced successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
export const syncDeletedCategories = async (req, res, next) => {
  try {
    const { categories } = req.body;
    const userId = req.user.userId;
    const result = await CategoryServices.syncDeletedCategories(
      userId,
      categories,
    );
    return res.status(200).json({
      message: "Deleted category synced successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
//#endregion
//#region DELETE

export const deleteCategory = async (req, res, next) => {
  try {
    const { id } = req.params;
    const userId = req.user.userId;
    const result = await CategoryServices.deleteOne(userId, id);
    return res.status(200).json({
      message: "Category deleted successfully",
    });
  } catch (e) {
    next(e);
  }
};

//#endregion
