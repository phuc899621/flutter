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
