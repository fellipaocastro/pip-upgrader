pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U

echo 'Do you want to save a new requirements.txt?'
select yn in 'Yes' 'No'; do
    case $yn in
        Yes)
            pip freeze --local > "$PWD/requirements.txt"; break;;
        No)
            exit;;
    esac
done
