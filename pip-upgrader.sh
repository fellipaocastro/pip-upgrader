VIRTUALENV=$(python -c 'import sys; print sys.real_prefix' 2>/dev/null && INVENV=1 || INVENV=0)
# VIRTUALENV=`python -c 'import sys; print sys.real_prefix' 2>/dev/null && INVENV=1 || INVENV=0`

if [ "$VIRTUALENV" != '' ]; then
    pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U

    echo "Do you want to save a new requirements.txt in $PWD?"
    select yn in 'Yes' 'No'; do
        case $yn in
            Yes)
                pip freeze --local > "$PWD/requirements.txt"; break;;
            No)
                exit;;
        esac
    done
else
    echo 'It is meant to run inside a virtualenv!'
fi
