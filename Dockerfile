FROM jupyter/minimal-notebook
WORKDIR /bootcamp

# install common dependencies
RUN pip install --upgrade poetry openai langchain python-dotenv

# Build using
# `docker build -t bootcamp` .
# We will use volume mapping instead of copying the content over, i.e., 
# we will run `docker run -p 8888:8888 --env-file .env -v "$(pwd)/bootcamp:/bootcamp" bootcamp`
# Copy over exercise notebooks
# COPY ./bootcamp/ /bootcamp/

CMD ["jupyter", "lab", "--no-browser","--NotebookApp.token=''","--NotebookApp.password=''"]