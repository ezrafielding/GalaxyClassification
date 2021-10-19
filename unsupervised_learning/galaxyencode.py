import tensorflow as tf
from tensorflow.keras.models import Model
from tensorflow.keras import layers

class GalaxyEncoder(Model):
    def __init__(self):
        super(GalaxyEncoder, self).__init__()
        self.encoder = tf.keras.Sequential ([
            layers.Input(shape=(14400,1)),
            layers.Conv1D(1, 25, activation=tf.nn.leaky_relu, strides=2),
            layers.Conv1D(32, 25, activation=tf.nn.leaky_relu, strides=2),
            layers.Conv1D(1, 25, activation=tf.nn.leaky_relu, strides=2),
            layers.MaxPool1D(3, 1)
        ])

    def call(self, x):
        return self.encoder(x)

autoencoder = GalaxyEncoder()
autoencoder.compile()
print(autoencoder.encoder.summary())