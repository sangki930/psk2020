package com.psk.kafka.firstkafka;

import com.psk.kafka.firstkafka.mq.Consumer;
import com.psk.kafka.firstkafka.mq.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class FirstkafkaApplication
implements CommandLineRunner {

	@Autowired
	private Producer producer;

	@Autowired
	private Consumer consumer;

	public static void main(String[] args) {
		SpringApplication.run(FirstkafkaApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		producer.send("HELLO KAFKA");

		/*Listener를 사용하는 경우
		* */
//		consumer.consume2();
	}

}
