package com.psk.kafka.firstkafka.mq;

import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.producer.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Properties;

@Component
@Slf4j
public class Producer {

    private KafkaProducer<String, String> producer = null;

    @Value("*{spring.kafka.bootstrap-servers}")
    private String bootstrapServer;

    @Value("*{spring.kafka.producer.key-serializer}")
    private String keySerializer;

    @Value("*{spring.kafka.bootstrap-servers}")
    private String valueSerializer;

    @Value("*{spring.kafka.template.default-topic}")
    private String topicName;

    @PostConstruct
    public void build(){
        Properties properties
                =new Properties();
        properties.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG,bootstrapServer);
        properties.setProperty(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,keySerializer);
        properties.setProperty(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG,valueSerializer);
       producer = new KafkaProducer<String, String>(properties);

    }

    public void send(String message){
        String result = "SEND FAIL";
        ProducerRecord<String,String> prd
                = new ProducerRecord<String,String>(this.topicName,message);
        try{
            producer.send(prd, new Callback() {
                @Override
                public void onCompletion(RecordMetadata metadata, Exception exception)
             {
                    if(exception!=null)
                        log.info(exception.getMessage());
                }
            });
            result = "SEND SUCCESS";
        }catch (Exception e){
            log.info(e.getMessage());
            e.printStackTrace();
        }
        finally {
            log.info(result+" : "+message);
            producer.close();
        }
    }
}
