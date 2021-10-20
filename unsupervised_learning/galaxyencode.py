import tensorflow as tf
from tensorflow.keras.models import Model
from tensorflow.keras import layers
from tensorflow.python.keras.layers.convolutional import Conv2DTranspose, UpSampling2D

class GalaxyEncoder(Model):
    def __init__(self):
        super(GalaxyEncoder, self).__init__()
        self.encoder = tf.keras.Sequential ([
            layers.InputLayer(input_shape=(224,224,3)),
            layers.Conv2D(16, (3,3), 1, padding="same", activation="relu"),
            layers.MaxPool2D((2,2), padding="same", strides=2),
            layers.Conv2D(8, (3,3), 1, padding="same", activation="relu"),
            layers.MaxPool2D((2,2), padding="same", strides=2),
            layers.Conv2D(8, (3,3), 1, padding="same", activation="relu"),
            layers.MaxPool2D((2,2), padding="same", strides=2),
            layers.Flatten()
        ])
        self.decoder = tf.keras.Sequential ([
            layers.InputLayer(input_shape=(6272)),
            layers.Reshape((28,28,8)),
            layers.Conv2DTranspose(8, (3,3), 2, padding="same", activation="relu"),
            layers.Conv2DTranspose(8, (3,3), 2, padding="same", activation="relu"),
            layers.Conv2DTranspose(16, (3,3), 2, padding="same", activation="relu"),
            layers.Conv2D(3, (3,3), 1, padding="same", activation="sigmoid")
        ])

    def call(self, x):
        encoded = self.encoder(x)
        decoded = self.decoder(encoded)
        return decoded

autoencoder = GalaxyEncoder()
autoencoder.compile()
print(autoencoder.encoder.summary())
print(autoencoder.decoder.summary())