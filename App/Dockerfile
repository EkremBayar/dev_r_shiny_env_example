FROM example/dev_r_shiny_env

# Copy your App
COPY App /App

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/App', port = 3838, host = '0.0.0.0')"]