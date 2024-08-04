FROM python:3.8-slim

RUN pip install gitpython scikit-learn pandas numpy

COPY git_analyzer.py /git_analyzer.py

ENTRYPOINT ["python", "/git_analyzer.py"]