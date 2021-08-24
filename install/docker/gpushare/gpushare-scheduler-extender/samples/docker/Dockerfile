FROM registry.eyecloudai:31500/eyecloudai/apeflow:2.0.0.142
RUN pip3 install tensorflow-gpu==2.0.0b1

COPY main.py /app/main.py
COPY run.sh /app/run.sh
RUN chmod u+x /app/run.sh
CMD ["/app/run.sh"]