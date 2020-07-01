package com.sample.demo.config.reader;

import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.NonTransientResourceException;
import org.springframework.batch.item.ParseException;
import org.springframework.batch.item.UnexpectedInputException;

public class QueueItemReader<T> implements ItemReader<T> {
    private Queue<T> queue;

    public QueueItemReader(List<T> data) {
        this.queue = new LinkedList<>(data); //(1)
    }

    @Override
    public T read() throws Exception, UnexpectedInputException, ParseException, NonTransientResourceException {
        return queue.poll(); //(2)
    }
    
    /*
     * (1) QueueItemReader를 사용해서 Sample을 지정될 타깃 데이터를 한번에 불러와 큐에 담아 놓음
		(2) read() 메서드를 사용할 때 큐의 poll()메서드를 통해서 큐에서 데이터를 하나씩 반환
     * */
}
