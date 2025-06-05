import multer from 'multer';

export const multerErrorHandler = (err, req, res, next) => {
  if (err instanceof multer.MulterError) {
    if (err.code === 'LIMIT_UNEXPECTED_FILE') {
      return res.status(400).json({
        message: `Please upload file using field name 'avatar', not '${err.field}'`,
        data: {}
      });
    }
    return res.status(400).json({
      message: err.message,
      data: {}
    });
  }
  next(err);
};
