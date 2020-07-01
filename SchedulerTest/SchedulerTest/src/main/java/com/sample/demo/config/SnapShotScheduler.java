package com.sample.demo.config;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SnapShotScheduler {

	@Scheduled(cron = "10 * * * * *")
    public void run() {
        log.info("hello2----");
    }

}
