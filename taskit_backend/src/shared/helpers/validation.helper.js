export const joiMsg = (
  label,
  {
    min = null,
    max = null,
    email = null,
    required = true,
    exactly = null,
    date = null,
    array = null,
    boolean = null,
    values = [],
  } = {},
) => {
  return {
    ...(array && { "array.base": `${label} must be an array` }),
    ...(required && { "string.empty": `${label} must not be empty` }),
    ...(required && { "any.required": `${label} is required` }),
    ...(date && { "string.isoDate": `${label} must be a valid date` }),
    ...(email && { "string.email": `Must be a valid email` }),
    ...(exactly && {
      "string.length": `${label} must be exactly ${exactly} characters`,
    }),
    ...(boolean && { "boolean.base": `${label} must be a boolean` }),
    ...(values.length > 0 && {
      "string.valid": `${label} must be one of ${values.join(", ")}`,
    }),
    ...(min &&
      exactly === null && {
        "string.min": `${label} must be at lest ${min} characters`,
      }),
    ...(max &&
      exactly === null && {
        "string.max": `${label} must be less than ${max} characters`,
      }),
  };
};
