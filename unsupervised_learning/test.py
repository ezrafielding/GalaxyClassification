import tensorflow as tf
from tensorflow.keras.models import Model
from tensorflow.keras import layers
from tensorflow.python.ops.gen_math_ops import Mod

input = layers.Input(shape=(120,120,1))

x = tf.nn.conv2d(input, [5,5,1], strides=[1,2,2,1], padding="VALID")

m = Model(input, x)
m.compile()
print(m.summary())