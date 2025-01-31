from kafka import KafkaConsumer
import json

def create_consumer(topic):
    return KafkaConsumer(
        topic,
        bootstrap_servers='localhost:9092',
        auto_offset_reset='earliest',
        enable_auto_commit=True,
        group_id='test-group',
        value_deserializer=lambda x: json.loads(x.decode('utf-8'))
    )

def consume_messages(topic):
    consumer = create_consumer(topic)
    for message in consumer:
        print(f"Received: {message.value}")

if __name__ == "__main__":
    consume_messages("test-topic")
