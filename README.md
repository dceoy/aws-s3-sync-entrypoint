aws-s3-sync-entrypoint
======================

Entrypoint command with data sync to and from AWS S3

Installation
------------

```sh
$ git clone https://github.com/dceoy/aws-s3-sync-entrypoint.git
$ cp -a aws-s3-sync-entrypoint/s3-sync-entrypoint /path/to/bin  # a path in ${PATH}
```

Docker image
------------

The image is available at [Docker Hub](https://hub.docker.com/r/dceoy/s3-sync-entrypoint/).

```sh
$ docker pull dceoy/s3-sync-entrypoint
```

Usage
-----

1.  Set local input and output directory paths as `LOCAL_INPUT_DIR` and `LOCAL_OUTPUT_DIR`.

    ```sh
    $ export LOCAL_INPUT_DIR=/input
    $ export LOCAL_OUTPUT_DIR=/output
    $ mkdir "${LOCAL_INPUT_DIR}" "${LOCAL_OUTPUT_DIR}"
    ```

2.  Run a command.

    ```sh
    $ s3-sync-entrypoint \
        --input=s3://bucket-i/input0 \
        --input=s3://bucket-i/input1 \
        --output=s3://bucket-o/output0 \
        cp -r /input/input0 /input/input1 /output/
    ```

    The above command works as follows:
    1.  Sync `s3://bucket-i/input0` and `s3://bucket-i/input1` to `/input` (`LOCAL_INPUT_DIR`).
    2.  Execute `cp -r /input/input0 /input/input1 /output/`.
    3.  Sync `/output` (`LOCAL_OUTPUT_DIR`) to `s3://bucket-o/output0`.

Run `s3-sync-entrypoint --help` for more information.
