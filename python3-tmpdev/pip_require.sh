#/bin/sh

if [ -f "/workspace/requirements.txt" ]; then
	echo "`requirements.txt` exists, install requirements for development evnironment ..."

	pip install -r /workspace/requirements.txt

    echo ""
	echo "To avoid installing package every time you run this env, use python-dev as a template by"
	echo "    dockeRun --template python-dev"
else
	echo "`requirements.txt` not exists,"
	echo "You need to install packages by `pip` on your own"
	echo "Or put `requirements.txt` in the root of the working directory and rerun the container to get package installed automatically."
	echo "Or use python-dev as a template by"
	echo "    dockeRun --template python-dev"
fi
echo ""

/bin/bash
