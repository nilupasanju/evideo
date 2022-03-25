
evideo Schema clone
#CREATE DATABASE EpicVideo;
mix phx.new evideo
cd evideo
mix ecto.create

#create table
mix ecto.gen.migration create_(tablename)

mix ecto.migrate

#REPO
### raw SQL

Repo.query

### executing a query directly

Repo.all
Repo.one

### batch / schema-less actions

Repo.insert_all
Repo.update_all
Repo.delete_all

### single queries (with schema, handle auto timestamps)

Repo.insert
Repo.update
Repo.delete

### Some other very common queries

Repo.get
Repo.get! (and analogues like insert!, delete!)
Repo.get_by

Repo.aggregate (with :count, :avg, etc)
Repo.exist?

#psql
rm /usr/local/var/postgres/postmaster.pid
brew services restart postgresql

#react
npx create-react-app evideo_ui
#create migration file
mix ecto.gen.migration create_country

#add table in migration file
def change do
    create table(:country) do
        add :country_name, :string

        timestamps()
    end
end
#execute
mix ecto.migrate



mix ecto.gen.migration create_states
def change do
    create table(:states) do
        add :state_name, :string
        add :country_id, references(:country, on_delete: :delete_all)
        timestamps()
    end
end
mix ecto.migrate

mix ecto.gen.migration create_cities
def change do
    create table(:cities) do
        add :city_name, :string
        add :postcode, :integer
        add :state_id, references(:states, on_delete: :delete_all)
        timestamps()
    end
end
mix ecto.migrate


mix ecto.gen.migration create_address_type
def change do
    create table(:address_type) do
        add :address_type, :string
        timestamps()
    end
end
mix ecto.migrate

mix ecto.gen.migration create_addresses
def change do
    create table(:addresses) do
        add :address1, :string, size: 50
        add :address2, :string, size: 50
        add :address3, :string, size: 50
        add :city_id, references(:cities, on_delete: :delete_all)
        add :address_type_id, references(:address_type, on_delete: :delete_all)
        timestamps()
    end
end
mix ecto.migrate

mix ecto.gen.migration create_customers
def change do
    create table(:customers) do
        add :first_name, :string, size: 50
        add :last_name, :string, size: 50
        add :phone, :integer, size: 10
        add :email, :string, size: 50
        add :no_of_rented_copies, :integer
        add :username, :string
        add :customer_password, :string

        timestamps()
    end


end
mix ecto.migrate

#alter table
mix ecto.gen.migration alter_customers_createuniqueindex
def change do
  alter table(:customers) do

  end
  create unique_index(:customers, [:username, :customer_password])
end
mix ecto.migrate

mix ecto.gen.migration customer_address
def change do
  create table(:customer_address) do
    add :address_id, references(:addresses, on_delete: :delete_all)
    add :customer_id, references(:customerse, on_delete: :delete_all)
  end
  create unique_index(:customers, [:customer_id])
end
mix ecto.migrate

mix ecto.gen.migration enquiry
def change do
    create table(:enquiry) do
      add :first_name, :string, size: 50
      add :phone, :integer, size: 10
      add :email, :string, size: 50
      add :enquiry, :string
    end
end
mix ecto.migrate

mix ecto.gen.migration login_staff
def change do
    create table(:login_staff) do
      add :first_name, :string, size: 50
      add :last_name, :string, size: 50
      add :username, :string, size: 50
      add :loginpassword, :string, size: 8
    end
    create unique_index(:login_staff, [:username])
end
mix ecto.migrate

mix ecto.gen.migration roles
def change do
    create table(:roles) do
      add :roles_description, :string, size: 50
    end
end
mix ecto.migrate

CREATE TABLE IF NOT EXISTS Roles (
    role_id INT not null primary key,
    roles_description varchar(255)
);

CREATE TABLE IF NOT EXISTS Staff(
    staff_id int not NULL,
    login_id INT UNIQUE,
    phone INT(10),
    email VARCHAR(100),
    gender VARCHAR(6),
    wage INT(7),


    PRIMARY KEY(staff_id),
    CONSTRAINT FK_LoginStaff FOREIGN KEY(login_id) REFERENCES LoginStaff(login_id)
);


CREATE TABLE IF NOT EXISTS Staff_Roles (
    role_id  INT,
    staff_id INT,

    FOREIGN KEY(staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY(role_id) REFERENCES Roles(role_id),
    UNIQUE (staff_id,role_id)
);

CREATE TABLE IF NOT EXISTS Staff_address(
    address_id INT,
    staff_id INT,

    FOREIGN KEY (address_id) REFERENCES Addresses(address_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    UNIQUE (address_id,staff_id)
);

CREATE TABLE IF NOT EXISTS Transactions(
    transaction_id INT not null AUTO_INCREMENT,
    staff_id int,
    customer_id INT ,
    date_of_pay DATE not null,
    amount DECIMAL not null,

    PRIMARY KEY(transaction_id),

    FOREIGN KEY(staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE IF NOT EXISTS Movie_genre(
    genre_id INT primary key not null,
    genre_description VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Customer_genre(
    genre_id INT not null,
    customer_id int not null,

    primary key (genre_id,customer_id)
);



CREATE TABLE IF NOT EXISTS Movies(
    movie_id INT primary key not null AUTO_INCREMENT,
    genre_id INT,
    title VARCHAR(100),
    movie_year INT(4),
    movie_description VARCHAR(255),
    movie_length TIME,
    daily_price DECIMAL,
    obselete BOOlean,


    FOREIGN KEY(genre_id) REFERENCES Movie_genre(genre_id)
);


CREATE TABLE IF NOT EXISTS Movie_Format(
    format_id INT primary key not null,
    format_typ VARCHAR(3)
);


CREATE TABLE IF NOT EXISTS Movie_Copies(
    copy_id INT not null AUTO_INCREMENT,
    movie_id INT not null,
    format_id INT not null,
    conditiontype VARCHAR(10),

    PRIMARY KEY(copy_id),
    FOREIGN KEY(movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY(format_id) REFERENCES Movie_Format(format_id)

);

CREATE TABLE IF NOT EXISTS Stock(
    movie_id INT not null,
    copy_id int not null,
    available_copies int,
    rented_copies int,
    damaged_copies int,
    stolen_copies int,

     PRIMARY KEY(copy_id,movie_id)

);

CREATE TABLE IF NOT EXISTS Rental_Status(
    rent_status_id INT primary key not null,
    status_description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Rating(
    rating_id INT primary key not null AUTO_INCREMENT,
    rating INT not null,
    rating_description VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS Customer_Rating(
    rating_id INT not null,
    movie_id INT not null,
    customer_id INT not null,

    PRIMARY KEY(rating_id,movie_id),
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE IF NOT EXISTS Packages(
    package_id INT primary key not null,
    no_of_days INT,
    package_name VARCHAR(10),
    price        decimal,
    format_id    INt,

    FOREIGN KEY(format_id) REFERENCES Movie_Format(format_id)
);


CREATE TABLE IF NOT EXISTS Rent_Movie(
    rent_id INT not null AUTO_INCREMENT,
    customer_id INT,
    rent_status_id INT,
    package_id INT,
    rent_date DATE not null,
    due_date DATE not null,
    rent_amount_due DECIMAL not null,
    note VARCHAR(255),

    PRIMARY KEY(rent_id),
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY(rent_status_id) REFERENCES Rental_Status(rent_status_id),
    FOREIGN KEY(package_id) REFERENCES Packages(package_id)
);


CREATE TABLE If not exists Messages (
    message_id INT not null primary key AUTO_INCREMENT,
    customer_id int,
    message_description VARCHAR(255),
    messagedate datetime,
    message_reply varchar(255),

    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

Create table if not exists images(
    image_id varchar(2) not null primary key,
    genre_id int not null,

    FOREIGN KEY(genre_id) REFERENCES Movie_genre(genre_id)

);

CREATE TABLE Blog(
    blog_id int NOT NULL primary key AUTO_INCREMENT,
    customer_id int,
    title varchar(100),
    content BLOB,
    comment varchar(255),
    create_date TIMESTAMP,

    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)

 );
