### How to Run
- Install Docker
- Download repo
- go to root directory ```cd loan_app```
- Run ```docker compose build```
- Run ```docker compose up```. If it says ports are not available, stop your already running postgres instance on 5432
- In separate terminal run
  - ```docker exec -it loan_app-web-1 sh``` i.e open bash in web container.
  - ```rails db:create db:migrate```
- You can explore the site at http://localhost:3000
