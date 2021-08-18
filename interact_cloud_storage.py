
from google.cloud import storage


def create_bucket_class_location(bucket_name):
    """Create a new bucket in specific location with storage class"""

    storage_client = storage.Client()

    bucket = storage_client.bucket(bucket_name)
    bucket.storage_class = "STANDARD"
    new_bucket = storage_client.create_bucket(bucket, location="us-east1")

    print(
        "Created bucket {} in {} with storage class {}".format(
            new_bucket.name, new_bucket.location, new_bucket.storage_class
        )
    )
    return new_bucket


if __name__ == '__main__':

    bucket_name = "edc-igti-moduloi"
    create_bucket_class_location(bucket_name)
