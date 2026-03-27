import { ValidationError } from "../shared/utils/error.js";

const validate = (schemas = {}) => {
  return (req, res, next) => {
    for (const key in schemas) {
      const schema = schemas[key];

      const { error, value } = schema.validate(req[key], {
        abortEarly: true,
        stripUnknown: true,
      });

      if (error) {
        throw new ValidationError(error.details[0].message);
      }

      req[key] = value;
    }

    next();
  };
};

export default validate;
