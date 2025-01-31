from kafka import KafkaProducer
import json
import time

def create_producer():
    return KafkaProducer(
        bootstrap_servers='localhost:9092',
        value_serializer=lambda v: json.dumps(v).encode('utf-8')
    )

def produce_messages(topic):
    producer = create_producer()
    while True:
        message = {"event": "test_event", "timestamp": time.time()}
        producer.send(topic, value=message)
        print(f"Sent: {message}")
        time.sleep(2)

if __name__ == "__main__":
    produce_messages("test-topic")

