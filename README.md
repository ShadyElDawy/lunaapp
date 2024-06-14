# MovieReviews Application

## Features:

1. **CSV Data Import:**
   - The application supports importing movie and review data from CSV files.
   - Separate CSV importer classes (`MoviesCsvImporter` and `ReviewsCsvImporter`) handle the data import process(in case we need to import only single table).
   - avoided using insert since it skips validations
   - Background jobs (`MoviesCsvImportJob` and `ReviewsCsvImportJob`) are used to process CSV imports asynchronously, enhancing application responsiveness.

2. **Data Models:**
   - Two main models are defined: `Movie` and `Review`.
   - The `Movie` model includes attributes such as title, description, year, director, actor, filming location, and country.
   - The `Review` model is associated with the `Movie` model and includes user, stars, and review attributes.

3. **Database Schema:**
   - The database schema is designed to efficiently store movie and review data.

4. **Search Functionality:**
   - Users can search for movies based on the actor's name.

5. **Sorting Movies by Average Stars:**
   - The application provides an efficient way to sort movies by their average star ratings.

6. **Optimizations and Best Practices:**
   - **Background Jobs with Sidekiq:**
     - The application utilizes the Sidekiq background processing framework for efficient job processing.
     - Sidekiq ensures that CSV imports are handled asynchronously, preventing delays in the web request/response cycle.

   - **Caching with Redis:**
     - Redis caching is implemented to optimize query performance.
     - Cached data is used to speed up repeated searches and queries.

## Instructions for Reviewers:
1. **Build and run docker:**
   - install docker and docker compose on your system and then run the following (`docker compose up --build`).

2. **CSV Import Process:**
   - To import movies and reviews, use the respective Rake tasks (`docker-compose exec web rails import:all`).
   - You can also import single table if needed (`docker-compose exec web rails import:movies`).
   - Background jobs will process the imports.