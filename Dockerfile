# syntax=docker/dockerfile:1.2
FROM python:3.9-slim-buster as base
COPY requirements.txt ./
RUN pip install -r requirements.txt
  
FROM base as notebook
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY requirements-notebook.txt ./
RUN pip install -r requirements-notebook.txt
USER root
