package com.sample.demo.config;

import java.util.List;

import javax.persistence.EntityManagerFactory;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepScope;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.batch.item.ItemWriter;
import org.springframework.batch.item.database.JpaPagingItemReader;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

import com.sample.demo.config.reader.QueueItemReader;
import com.sample.demo.domain.Sample;
import com.sample.demo.repo.SampleRepository;
import com.sample.demo.repo.SampleResultsRepository;
import com.sample.demo.service.SampleService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Configuration
@RequiredArgsConstructor
@EnableScheduling
@Slf4j
public class BatchSampleJobConfig {
	
	private final SampleService sampleService;
	
	private final SampleRepository sampleRepository;
	
	private final EntityManagerFactory entityManagerFactory;
	
	private final SampleResultsRepository sampleResultsRepository;
	
	private final int CHUNK_SIZE = 1000;

	//Job 설정
	@Bean
    public Job inactiveSampleJob(JobBuilderFactory jobBuilderFactory, Step batchJobStep) { //(1)
		//
		log.info("Job 실행");
		
        return jobBuilderFactory.get("inactiveSampleJob")
//                .preventRestart() //(2)
                .start(batchJobStep) //(3)
                .build();
    }
	
	/*
	 * (1) Job 생성을 직관적이고 편리하게 도와주는 빌더 JobBuilderFactory를 주입
	 * (2) inactiveSampleJob 이라는 JobBuilder를 생성하며 preventRestart() 설정을 통해 재실행을 막음
	 * (3) start(inactiveJobStep)은 파라미터에서 주입받은 휴먼회원 관련 Step인 inactiveJobStep을 제일 먼저 실행하도록 설정하는 부분
	 * */
	
	@Bean
	public Step inactiveJobStep(StepBuilderFactory stepBuilderFactory) {
		
		log.info("step 실행");
		
	    return stepBuilderFactory.get("inactiveSampleStep") //(1)
	            .<Sample, Sample> chunk(CHUNK_SIZE) //(2)
	            .reader(inactiveSampleReader()) //(3)
	            .processor(inactiveSampleProcessor())
	            .writer(inactiveSampleWriter())
	    		
//	            .tasklet((contribution, chunkContext) -> {
//                    log.info(">>>>> This is Step1");
//                    return RepeatStatus.FINISHED;
//                })
	            .build();
	}
	
	/*
	 * (1) stepBuilderFactory.get("inactiveSampleStep")로 inactiveSampleStep 이라는 이름의 StepBuilder를 생성
		(2) 제네릭을 사용해서 chunk() 의 입력과 추력 타입을 Sample로 설정 했습니다. chunk의 인자값은 1000으로 설정해서 쓰기 시에 청크 단위로 writer() 메서드를 실행시킬 단위를 지정했습니다. 즉 커밋단위가 10개
		(3) step의 reader, processor, writer를 각각 설정
	 * */
	
	@Bean
	@StepScope //(1)
	public QueueItemReader<Sample> inactiveSampleReader() {
	    //(2)
	    List<Sample> list =  sampleService.getSamples();
	    //모든 샘플을 가져옴
	    
	    return new QueueItemReader<Sample>(list); //(3)
	}
	
	/*
	 * (1) 기본 빈 생성은 싱글턴이지만 @StepScope를 사용하면 해당 메서드는 Step의 주기에 따라 새로운 빈을 생성한다.
	 * 즉, 각 Step의 실행마다 새로운 빈을 만들기 때문에 지연 생성이 가능합니다. 
	 * 주의할 사항은 @StepScope는 기본 프록시 모드가 반환되는 클래스 타임을 참조하기 때문에 @StepScode를 사용하면 반드시 구현된 반환 타입을 명시해 변환해야합니다. 
	 * 해당 예제는 QueueItemReader라고 명시했습니다.
		(2) 모든 Sample을 가져옴
		(3) QueueItemReader 객체를 생성하고 불러온 휴먼회원 타깃 대상을 데이터 객체에 넣어 반환합니다.

	 * */
	
	public ItemProcessor<Sample, Sample> inactiveSampleProcessor() {
	    return sample -> sample.setBatch();
	}
	/*
	 * 읽은 Sample을 만든 시간을 변경하여 세팅하는 processor 설정
	 * */
	

	public ItemWriter<Sample> inactiveSampleWriter() {
		
	    return ((List<? extends Sample> samples) -> {
	    	
	    	for(Sample s : samples) {
	    		log.info("샘플 : "+s.toString());
	    	}
	    	
	    	sampleResultsRepository.saveAll(samples);
	    	
	    	
	    });
	}
	
	/*
	 * ItemWriter는 리스트 타입을 앞서 설정한 청크 단위로 받습니다. 
	 * 청크 단위를 10으로 설정했기 때문에 Samples에게 휴면회원 10개가 주어지며
	 *  saveAll()메서드를 통해서 한번에 DB에 저장합니다.
	 * */
	

	
	@Bean
	@StepScope
	public JpaPagingItemReader<Sample> insactiveSampleJpaReader(){
		JpaPagingItemReader<Sample> jpaPagingItemReader = new JpaPagingItemReader<>();
		jpaPagingItemReader.setPageSize(CHUNK_SIZE);
		return jpaPagingItemReader;
	}
	
	
//	@Bean(destroyMethod="") //(1)
//	@StepScope
//	public JpaPagingItemReader<Sample> inactiveSampleJpaReader(@Value("#{jobParameters[nowDate]}") Date nowDate) {
//		
//		
//		
//	    JpaPagingItemReader<Sample> jpaPagingItemReader = new JpaPagingItemReader<>();
//	    jpaPagingItemReader.setQueryString("select u from Sample as u where u.createdDate < :createdDate and u.status = :status"); //(2)
//
//	    Map<String, Object> map = new HashMap<>();
//	    LocalDateTime now = LocalDateTime.ofInstant(nowDate.toInstant(), ZoneId.systemDefault());
//	    map.put("createdDate", now.minusYears(1));
//	    map.put("status", SampleStatus.ACTIVE);
//	    
//	    
//
//	    jpaPagingItemReader.setParameterValues(map); //(3)
//	    jpaPagingItemReader.setEntityManagerFactory(entityManagerFactory); //(4)
//	    jpaPagingItemReader.setPageSize(CHUNK_SIZE); //(5)
//	    return jpaPagingItemReader;
//	}
	/*
	 * (1) 스프링에서 destroyMethod를 사용해서 삭제할 빈을 자동으로 추적합니다. destroyMethod=""를 설정하면 warring 메세지를 제거할 수 있다
(2) JpaPagingItemReader를 사용하면 쿼리를 직접 짜고 실행 하는 방법밖에는 없음
(3) 쿼리리에서 사용된 updateDate, status 파라미터를 Mpa에 추가해서 사용할 파라미터를 설정합니다
(4 )트랜잭션을 관리해줄 entityManagerFactory를 설정합니다.
(5) 한번에 읽어올 크기를 CHUNK_SIZE 만큼 할당합니다.
	 * 
	 * */
	}
