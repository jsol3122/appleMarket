package handler;

import java.util.ArrayList;

import javax.validation.ConstraintViolationException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ControllerExceptionHandler {
	
	@ExceptionHandler(ConstraintViolationException.class)
	public ResponseEntity<ErrorDto> testException(ConstraintViolationException exception) {
		ErrorDto errorDto = new ErrorDto();
		errorDto.setErrorCode("invalid_input");
		errorDto.setErrorMessage(new ArrayList<>(exception.getConstraintViolations()).get(0).getMessage());
		
		return new ResponseEntity<>(errorDto, HttpStatus.BAD_REQUEST);
	}

}
