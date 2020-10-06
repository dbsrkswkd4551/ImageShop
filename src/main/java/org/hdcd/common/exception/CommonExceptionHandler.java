package org.hdcd.common.exception;

import lombok.extern.java.Log;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.file.AccessDeniedException;

@Log
@ControllerAdvice
public class CommonExceptionHandler {

    @ExceptionHandler(NotEnoughCoinException.class)
    public String handleNotEnoughCoinException(NotEnoughCoinException ex, WebRequest request){
        log.info("hadleNotEnoughCoinException.");

        return "redirect:/coin/notEnoughCoin";

    }

    @ExceptionHandler(NotMyItemException.class)
    public String handleNotMyItemException(NotMyItemException ex, WebRequest request){
        log.info("handleNotMyItemException");

        return "redirect:/useritem/notMyItem";
    }

    @ExceptionHandler(AccessDeniedException.class)
    public void handleAccessDeniedException(AccessDeniedException ex, HttpServletRequest request, HttpServletResponse response) throws Exception{
        if(isAjax(request)) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        }
        else {
            throw ex;
        }
    }

    @ExceptionHandler(Exception.class)
    public String handle(Exception ex){
        log.info("handle ex" + ex.toString());

        return "error/errorCommon";
    }

    public static boolean isAjax(HttpServletRequest request) {
        return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }
}
