# docker-spinnaker-cassandra
Cassandra Configured For Spinnaker

```
  - name: cassandra
    ports:
      - {port: 9042, name: cql}
      - {port: 9160, name: thirft}
    strategy: RollingUpdate
    containers:
      - name: cassandra
        image: tristar:5000/spinnaker-cassandra
        ports:
          - containerPort: 9042
            name: cql
          - containerPort: 9160
            name: thrift
        lifecycle:
          postStart:
            exec:
              command: ["/setup.sh"]
```
