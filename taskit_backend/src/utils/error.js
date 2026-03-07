export class BaseError extends Error {
  constructor(statusCode, message, detail = null) {
    super(message);

    this.statusCode = statusCode;
    this.detail = detail;
    this.type = this.constructor.name;

    Error.captureStackTrace(this, this.constructor);
  }
}

export class HttpError extends BaseError {
  constructor(statusCode, message, detail = null) {
    super(statusCode, message, detail);
  }
}

export class NotFoundError extends BaseError{
  constructor(message = "Not found", detail = null) {
    super(404, message, detail);
  }
}

export class ConflictError extends BaseError {
  constructor(message = "Conflict", detail = null) {
    super(409, message, detail);
  }
}

export class ValidationError extends BaseError {
  constructor(message = "Validation failed", detail = null) {
    super(400, message, detail);
  }
}
export class AuthenticationError extends BaseError {
  constructor(message = "Authentication failed", detail = null) {
    super(401, message, detail);
  }
}

export class AuthorizationError extends BaseError {
  constructor(message = "Authorization failed", detail = null) {
    super(403, message, detail);
  }
}
export class DatabaseError extends BaseError {
  constructor(message = "Database error", detail = null) {
    super(500, message, detail);
  }
}