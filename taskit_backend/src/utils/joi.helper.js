export const joiMsg = (
  label,
  { min = null, max = null, email = null, required = true },
) => {
  return {
    ...(required && { "string.empty": `${label} must not be empty` }),
    ...(required && { "any.required": `${label} is required` }),
    ...(email && { "string.email": `Must be a valid email` }),
    ...(min !== null && {
      "string.min": `${label} must be at lest ${min} characters`,
    }),
    ...(max && {
      "string.max": `${label} must be less than ${max} characters`,
    }),
  };
};
