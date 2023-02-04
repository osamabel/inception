sudo docker compose down
sudo rm -fr ~/volume/maria/*
sudo rm -fr ~/volume/wordpress/*
sudo docker system prune -af
# sudo docker compose build