# aidev-bootcamp
Repo for AI Dev Bootcamp

# Setting up

The recommended way is to use the `docker` setup below. Alternatively, you may run the notebooks either locally using a python 3.x with Jupyter notebook installation, or remotely using services such as GitHub CodeSpace.

## Cloning 
Clone this repo to your host, using `git clone` or any other method. Nevigate to the downloaded folder (say `aidev-bootcamp`) either in a terminal or a file manager (or in VS Code).

## The Docker setup

Make sure you have the latest docker installed on your computer (aka the host). You only need the `free` docker CLI tool; no need for Docker Desktop, which requires a paid license for many users. Follow the instructions to verify that your docker is properly installed, and you can access the `docker` command via a terminal CLI.

Next, create a `.env` file in the directory, at the same level where you find the `Dockerfile`. Make sure in your `.gitignore` file you already excluded `.env` from being checked in. **Do not check in the `.env` file or you will expose the API key.**

The content of this file should be:
```
OPENAI_API_KEY=sk-xxxxxxxxx
```
where `sk-xxxxxxxxx` if the OpenAI API key assigned to you. Later we will add Azure OpenAI Service API key.

Then in a terminal:

```sh
cd /path/to/aidev-bootcamp
docker build -t bootcamp .
# for macs
docker run -p 8888:8888 --env-file .env -v "$(pwd)/bootcamp:/bootcamp" bootcamp
# for Windows
docker run -p 8888:8888 --env-file .env -v "%cd%/bootcamp:/bootcamp" bootcamp
```

This may take a while for the initial run to build the docker image. Once it is done, this will start a Jupyter server in the docker container, accessible via port 8888. On your host machine, launch your browser https://localhost:8888 to access the Jupyter lab.

## GitHub CodeSpace 
You can run the notebooks remotely on GitHub's CodeSpace, free for a limited number of hours. The repo is set up to do so, with a caveat below. 

1. Clone this repo to your own GitHub account. Use your own fork please.
1. In your own fork, using the GitHub web UI, under the `code` tab, click the green `<>Code` button, and select `CodeSpace`
1. If you haven't created a codespace for this project, select `Create a codespace on main`. This will launch the codespace -- effectively creating a VM for you. We use the standard GitHub Jupyter CodeSpace template, see [.devcontainer.json].
  - Note that this reads from [requirements.txt] when building the VM. This uses a different docker base image and different libraries from the `docker` solution above. So far I haven't noticed anything worth fixing.
1. If all goes well, you will see a VS Code interface in the web UI -- running in the VM. 
1. On the left hand side, open a notebook file, and it will automatically launch Jupyter in the main editor. 
  - In some cases you may see strange errors, while the VM is finishing installing some stuff. You can see the log in the terminal window. After that settles, rerun the notebook/cell.
1. You should be able to run the notebook cells -- you may need to select the `kernel` the first time running. Choose the local Python kernel. 

**Caveat:**: If you start the notebooks this way, you don't have the `OPENAI_API_KEY` environment variable set in the VM (which we do in the `docker` solution). I haven't figured out a way to do so without exposing your API key to the world. The workaround is to change the code and run something like 

```python
openai.api_key = "sk-xxxxx"
```
first. Once you run it, you can delete this line so that others don't see the API key. 

## Local Python installation
This is not recommended for the Bootcamp, and should be used as a last resort. You are likely to run into version conflicts or mess up your other projects if you are not familar with Python environment isolation. But if you know what you are doing, nothing will stop you. 

Here's the general instruction:

1. Make sure you have a python 3.1x installation on your local computer. 
1. Make sure you can run Jupyter notebook from that python instllation; if not, install Jupyter notebook or Jupyter lab/hub
1. Expose your OpenAPI Key in the environment variable, following the best practice for your OS. You want to make sure you can access this API key as an environmental variable from within Jupytor.
1. Make sure you can access the sample notebooks from Jupyter.

# Using the Jupyter notebooks

The example notebooks provide step-by-step instructions on how to interact with the OpenAI API. Jupyter notebook is in the style of programming called Literate Programming (very interesting history). Read on Jupyter Notebook to familarize yourself with the UI. To start:
- Use shift-enter to run a code cell and see its results. It runs all the code lines within the cell.
- You can run code cells in any order you like. 
- Edit code and re-run using shift-enter again. 
- You can add/delete code cells or rearrange the order using the UI.
- You should use markdown and title cells for comments and explanations. You can use in-line comments in your code but you can do a lot more using markdown outside of the code. 

Jupyter notebook is great for learning and exploring, but not great for production level software development. You can export a notebook as Python code, and move it elsewhere for further development.

