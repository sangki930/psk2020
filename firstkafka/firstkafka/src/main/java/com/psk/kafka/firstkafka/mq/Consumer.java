package com.psk.kafka.firstkafka.mq;

import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.messaging.MessageHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Properties;

@Component
@Slf4j
public class Consumer {

    private KafkaConsumer<String,String> consumer=null;
    @Value("*{spring.kafka.bootstrap-servers}")
    private String bootstrapServer;

    @Value("*{spring.kafka.consumer.group-id}")
    private String groupID;

    @Value("*{spring.kafka.consumer.key-deserializer}")
    private String keyDesSerializer;

    @Value("*{spring.kafka.consumer.key-deserializer}")
    private String valueDeSerializer;

    @Value("*{spring.kafka.consumer.auto-offset-reset}")
    private String offsetReset;

    @Value("*{spring.kafka.template.default-topic}")
    private String topicName;

    @Value("*{spring.kafka.consumer.max-poll-records}")
    private String maxPollRecords;

    @Value("*{spring.kafka.consumer.enable-auto-commit}")
    private String enableAutoCommit;

    @PostConstruct
    public void build(){
        Properties properties = new Properties();
        properties.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG,bootstrapServer);
        properties.setProperty(ConsumerConfig.GROUP_ID_CONFIG,groupID);
        properties.setProperty(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG,keyDesSerializer);
        properties.setProperty(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG,valueDeSerializer);
        properties.setProperty(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG,offsetReset);
        properties.setProperty(ConsumerConfig.MAX_POLL_RECORDS_CONFIG,maxPollRecords);
        properties.setProperty(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG,enableAutoCommit);
        consumer = new KafkaConsumer<String, String>(properties);

    }

    @KafkaListener(topics = "${spring.kafka.template.default-topic}")
    /*
    @KafkaListener : 메시지를 핸들링하는 메소드에 적용하면,
    Spring Boot가 메시지를 계속 subsribe 할 수 있도록 해줌
    * */
    public void consume(@Header MessageHeaders headers,
                        @Payload String payload){
        log.info("CONSUME HEADERS : "+headers.toString());
        log.info("CONSUME PAYLOAD : "+ payload);
    }

}
