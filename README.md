# Job Portal

Job Portal is a comprehensive solution for recruitment and hiring processes, built using Laravel. It offers a complete platform for job seekers, employers, and administrators, including secure payment options for boosting hiring processes.

## Features

- **Job Listings:** Browse and search through a wide range of job listings based on various criteria such as location, industry, and experience level.

- **Job Applications:** Apply for jobs directly through the portal, with the ability to upload resumes and cover letters.

- **Employer Accounts:** Employers can create accounts, post job listings, and manage applications from candidates.

- **Admin Panel:** Administrators have access to a powerful admin panel for managing users, job listings, payments, and other aspects of the portal.

- **Secure Payments:** Secure payment options are available for employers to boost their job listings and increase visibility.

## Installation

To set up the Job Portal, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/yaseenyahya021/Leopard-Job-Portal-Laravel.git
    ```

2. Navigate to the project directory:

    ```bash
    cd job-portal
    ```

3. Install dependencies:

    ```bash
    composer install
    ```

4. Copy the `.env.example` file and rename it to `.env`. Update the database and other configurations as needed.

5. Generate the application key:

    ```bash
    php artisan key:generate
    ```

6. Migrate the database:

    ```bash
    php artisan migrate
    ```

7. Seed the database with sample data (optional):

    ```bash
    php artisan db:seed
    ```

8. Serve the application:

    ```bash
    php artisan serve
    ```

9. Access the application in your web browser at `http://localhost:8000`.

## Usage

1. **Job Seekers:** Register an account, browse job listings, and apply for jobs that match their skills and preferences.

2. **Employers:** Create employer accounts, post job listings, review applications, and manage the hiring process.

3. **Administrators:** Access the admin panel to manage users, job listings, payments, and other aspects of the portal.

4. **Boost Hiring:** Employers can opt for secure payment options to boost their job listings and increase visibility to potential candidates.

## Contributing

Contributions are welcome! If you'd like to contribute to the Job Portal, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix:

    ```bash
    git checkout -b feature/your-feature
    ```

3. Make your changes and commit them:

    ```bash
    git commit -m "Add your feature"
    ```

4. Push to the branch:

    ```bash
    git push origin feature/your-feature
    ```

5. Create a pull request.

## Contact

For inquiries or support, please contact [yaseenyahya021@gmail.com](yaseenyahya021@gmail.com).
