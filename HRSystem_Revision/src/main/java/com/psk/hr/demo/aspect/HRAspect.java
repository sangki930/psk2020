package com.psk.hr.demo.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class HRAspect {

	Logger logger =  LoggerFactory.getLogger(HRAspect.class);

	//UserItem에 AOP 적용
    @Around("execution(* com.psk.hr.demo.repo.UserItemRepository.*(..))")
    public Object UserItemlogging(ProceedingJoinPoint pjp) throws Throwable {
        logger.info("start - " + pjp.getSignature().getDeclaringTypeName() + " / " + pjp.getSignature().getName());
        Object result = pjp.proceed();
        logger.info("finished - " + pjp.getSignature().getDeclaringTypeName() + " / " + pjp.getSignature().getName());
        return result;
    }


    @Around("execution(* com.psk.hr.demo.repo.TestEntityRepository.*(..))")
    public Object TestEntitylogging(ProceedingJoinPoint pjp) throws Throwable {
        logger.info("start - " + pjp.getSignature().getDeclaringTypeName() + " / " + pjp.getSignature().getName());
        Object result = pjp.proceed();
        System.out.println(result);
        logger.info("finished - " + pjp.getSignature().getDeclaringTypeName() + " / " + pjp.getSignature().getName());
        return result;
    }
	
}
