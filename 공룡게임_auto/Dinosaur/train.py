import tensorflow as tf
import tensorflow.compat.v1 as tf1
from tensorflow.keras import layers
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras.callbacks import ModelCheckpoint, EarlyStopping

## tensorflow 2.0에서 keras 클래스는 그냥쓰면 안됨
## 반드시 tensorflow.keras로 써줘야함

import pandas as pd
import numpy

import matplotlib.pyplot as plt
import h5py


tf1.disable_v2_behavior() # tensorflow 2.0을 쓸 때, 하위버전 코드가 실행될 수 있도록하는 함수

# seed 값 설정
seed = 0
numpy.random.seed(seed)
tf1.set_random_seed(seed)


# 데이터 입력
df_pre = pd.read_csv('dino1.csv', header=None)
df = df_pre.sample(frac=1)

dataset = df.values
X = dataset[:,0:6]
Y = dataset[:,6]

# 모델 설정
model = Sequential()
model.add(Dense(30,  input_dim=6, activation='relu'))
model.add(Dense(12, activation='relu'))
model.add(Dense(8, activation='relu'))
model.add(Dense(1, activation='sigmoid'))

#모델 컴파일
model.compile(loss='binary_crossentropy',
           optimizer='adam',
           metrics=['accuracy'])

# 모델 실행(keras)
model.fit(X, Y, epochs=1500, batch_size=200)
#epoch : 학습 횟수, batch_size = 한 번하는 데 학습하는 데이터

model.save('dino1.h5')

# 결과 출력
print("\n Accuracy: %.4f" % (model.evaluate(X, Y)[1]))